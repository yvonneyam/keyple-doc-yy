---
title: "Keyple Calypso – Evolution 0.9"
linkTitle: "2.2 Keyple Calypso Evo 0.9"
date: 2020-02-24
weight: 2
description: >
  Revised Calypso API 0.9
---

# The PO selection API
The role of this API is
* to detect the presentation of a particular Calypso PO,
* to select the target application (in the ISO7816-4 sense),
* to execute additional commands (among a reduced set) following the selection.

The data produced by this mechanism is a CalypsoPo object (instance of the generic keyple-core object AbstractMatchingSe).

The CalypsoPo object contains the information derived from the FCI analysis received in response to the selection command as well as the data received in response to any additional commands that may have been executed.

The Keyple Calypso selection API is an extension of the Keyple Core selection API and consists in the following classes:

## PoSelector

Defines the elements for selecting a Calypso PO:
* Extends SeSelector
* Provides the PoAidSelector inner class which extends AidSelector with the information needed to process invalidated POs. The AID value is used to select the PO application as defined by ISO7816-4 (at least 5 and up to 16 bytes).
* Provides the PoAtrFilter inner class which extends AtrFilter without addition.
The filtering mechanism consists of a regular expression targeting the ATR of the PO. In the contactless mode the notion of ATR does not exist, it is emulated a posteriori by the reader (cf. PC/SC). The actual value of the ATR returned by the reader can thus vary from one reader to another according to the interpretation made by the manufacturer. This makes this value something that will have to be adjusted according to the hardware configuration.

The PoSelector acts as a filter to designate the Calypso PO you are targeting. Based on the generic keyple-core selection mechanism it implements filtering by communication protocol (ISO, B Prime) and by AID or ATR.
Thus, any SE that does not meet the criteria defined by the PoSelector will not be reported to the application.
The selection modes by AID or ATR are exclusive. The ATR mode targets POs that do not have AID selection capability such as very old PO revision 1.0.



### Summary
```java
public enum InvalidatedPo {
    REJECT, ACCEPT
}

/* Constructor */
public PoSelector(SeProtocol seProtocol, 
                    PoAtrFilter poAtrFilter, 
                    PoAidSelector poAidSelector, 
                    String extraInfo)

public PoAidSelector(IsoAid aidToSelect, 
                        InvalidatedPo invalidatedPo,
                        FileOccurrence fileOccurrence, 
                        FileControlInformation fileControlInformation)

public PoAidSelector(IsoAid aidToSelect, InvalidatedPo invalidatedPo)

public PoAtrFilter(String atrRegex)
```

## PoSelectionRequest

This class is used to build the SeRequest that is executed when detecting an SE identified as a Calypso PO using the PoSelector described above.

The PoSelectionRequest is provided as a preparation case for the generic SeSelection; several PoSelectionRequests can be prepared to target different POs. Here, attention should be paid to the order in which the selection cases are placed in the generic SeSelection (see the generic selection API).

The result of the selection is returned by the means of the generic keyple-core selection (explicit or default modes, ReaderEvent notification).

### Addtional commands

In addition to the "Select Application" command, the SeRequest produced by PoSelectionRequest can embed additional commands sent to the PO following the selection.

These additional commands are the "Select File" and "Read Records" commands; they are included in the selection SeRequest by calls to the "prepare" commands corresponding to them prior to providing the PoSelectionRequest object to the prepareSelection method of the keyple-core SeSelection class (see Keyple Core API).

The "prepare" methods don't return anything. The result of their execution will be reported in the CalypsoPo object when processing the selection SeRequest.

## Matching SE

Another role of PoSelectionRequest is to provide the keyple-core selection mechanism with the means to build a CalypsoPo object. This object is returned by the getMatchingSe method of MatchingSelection (keyple-core).

For that, PoSelectionRequest implements the protected method "parse" which allows this specialization in CalypsoPo of the AbstractMatchingSe. The CalypsoPo is created from the parsing of the Select Application response (FCI) when the generic selection is processed.

### Summary
| Public methods                      |
|-------------------|-----------------|
| `void`   | `prepareSelectFileCmd(byte[] path, String extraInfo)` |
| `void`   | `prepareSelectFileCmd(SelectFileCmdBuild.SelectControl selectControl, String extraInfo)` |
| `void`   | `prepareReadRecordsCmd(byte sfi, ReadDataStructure readDataStructureEnum, byte firstRecordNumber, int expectedLength, String extraInfo)` |
| `void`   | `prepareReadRecordsCmd(byte sfi, ReadDataStructure readDataStructureEnum, byte firstRecordNumber, String extraInfo)` |

```java
/* Constructor */
public PoSelectionRequest(PoSelector poSelector) 

public void prepareSelectFileCmd(byte[] path, String extraInfo)

public void prepareSelectFileCmd(SelectFileCmdBuild.SelectControl selectControl, String extraInfo)

public void prepareReadRecordsCmd(byte sfi, ReadDataStructure readDataStructureEnum,
        byte firstRecordNumber, int expectedLength, String extraInfo)

public void prepareReadRecordsCmd(byte sfi, ReadDataStructure readDataStructureEnum,
        byte firstRecordNumber, String extraInfo)
```

## CalypsoPo
The CalypsoPo object holds all known information about the PO being processed. The object is created at the time the PO is selected and will be progressively updated during the subsequent processing, especially during the operations carried out with PoTransaction.

This information includes:
* Data extracted from the analysis of the selection itself: analysis of the FCI field (or the ATR in the case of Rev 1.0):
  * Invalidation status
  * DF Name
  * Serial Number
  * Revision
  * The class byte to be used in APDU commands to this PO
  * Application type, subtype
  * Software issuer, version, revision
  * Availability of optional features: PIN, Stored Value
  * Ratification required flag
  * Mode 3.2
  * Characteristics of the modification buffer: count mode, size
* Data resulting from the execution of additional commands sent in the selection phase or executed later with PoTransaction:
  * File selection status
  * File records and counters values: read and written ?
  * PIN presentation status
  * Stored Value logs
  * Secure session status (written values may depend on the secure session state and therefore do not represent the true status of the PO's memory)
  * The status of failed commands, if any

### Java API
```java
public CalypsoPo(SeResponse selectionResponse, TransmissionMode transmissionMode, String extraInfo)

public PoRevision getRevision()

public byte[] getDfName()

public byte[] getApplicationSerialNumber()

public byte[] getAtr()

public boolean isModificationsCounterInBytes()

public int getModificationsCounter()

public byte getBufferSizeIndicator()

public int getBufferSizeValue()

public byte getPlatformByte()

public byte getApplicationTypeByte()

public boolean isRev3_2ModeAvailable()

public boolean isRatificationCommandRequired()

public boolean hasCalypsoStoredValue()

public boolean hasCalypsoPin()

public byte getApplicationSubtypeByte()

public byte getSoftwareIssuerByte()

public byte getSoftwareVersionByte()

public byte getSoftwareRevisionByte()

public boolean isDfInvalidated()

public PoClass getPoClass()

missing:
Further PO identification data (CD Light, GTML, CD21, etc)
PIN presentation status
Stored Value logs
Content of the files, value of counters
```

# The SAM selection API
## SamSelectionRequest
The SamSelectionRequest just overrides SeSelectionRequest to provide a way to build a CalypsoSam object during the selection process.
### Java API
```java
public SamSelectionRequest(SamSelector samSelector)
```
## CalypsoSam
The CalypsoSam object is the result of a selection made with a SamSelectionRequest.

All information is extracted from the ATR.

Note: in the case of a HSM, the CalypsoSam is built from an ATR reconstituted from the information available at the HSM level.

### Java API
```java
public CalypsoSam(SeResponse selectionResponse, TransmissionMode transmissionMode, String extraInfo)

public SamRevision getSamRevision() 

public byte[] getSerialNumber() 

public byte getPlatform() 

public byte getApplicationType() 

public byte getApplicationSubType() 

public byte getSoftwareIssuer() 

public byte getSoftwareVersion() 

public byte getSoftwareRevision() 
```