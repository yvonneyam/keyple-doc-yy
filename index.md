# 'Eclipse Keyple' project (2018/09/03)

## Documentations & binaries
### Functional specifications:

 - **'Keyple Core module' specification**': [https://calypsonet.github.io/keyple-doc/keyple-core-spec/](https://calypsonet.github.io/keyple-doc/keyple-core-spec/) 
 - **'Keyple Calypso Library specification'**: [https://calypsonet.github.io/keyple-doc/keyple-extension-calypso-spec/](https://calypsonet.github.io/keyple-doc/keyple-extension-calypso-spec/)

### JavaDoc{s}
- Keyple API
  - Keyple **'Core module'** JavaDoc: [https://calypsonet.github.io/keyple-java/develop/keyple-core/javadoc/](https://calypsonet.github.io/keyple-java/develop/keyple-core/javadoc/)
  - Keyple **'Calypso Library'** JavaDoc: [https://calypsonet.github.io/keyple-java/develop/keyple-calypso/javadoc/](https://calypsonet.github.io/keyple-java/develop/keyple-calypso/javadoc/)
- Keyple plugins
  - Keyple **'PC/SC' plugin** JavaDoc: [https://calypsonet.github.io/keyple-java/develop/keyple-plugin/pcsc/javadoc/](https://calypsonet.github.io/keyple-java/develop/keyple-plugin/pcsc/javadoc/)
  - Keyple **'Stub' plugin** JavaDoc: [https://calypsonet.github.io/keyple-java/develop/keyple-plugin/stub/javadoc/](https://calypsonet.github.io/keyple-java/develop/keyple-plugin/stub/javadoc/)
  - Keyple **'Android NFC' plugin** JavaDoc: [https://calypsonet.github.io/keyple-java/develop/keyple-plugin/android-nfc/javadoc/](https://calypsonet.github.io/keyple-java/develop/keyple-plugin/android-nfc/javadoc/)
  - Keyple **'Android OMAPI' plugin** JavaDoc: [https://calypsonet.github.io/keyple-java/develop/keyple-plugin/android-omapi/javadoc/](https://calypsonet.github.io/keyple-java/develop/keyple-plugin/android-omapi/javadoc/)
 - Examples
   - PC demo JavaDoc: [https://calypsonet.github.io/keyple-java/develop/keyple-example/pc/javadoc/](https://calypsonet.github.io/keyple-java/develop/keyple-example/pc/javadoc/)
   - Common demo JavaDoc: [https://calypsonet.github.io/keyple-java/develop/keyple-example/common/javadoc/](https://calypsonet.github.io/keyple-java/develop/keyple-example/common/javadoc/)
 
### JARs
Keyple modules - simple archives:
- **'Keyple Core module' JAR**:  [https://calypsonet.github.io/keyple-java/develop/jars/keyple-core-1.0.0-RC4.jar](https://calypsonet.github.io/keyple-java/develop/jars/keyple-core-1.0.0-RC4.jar)
 - **'Keyple Calypso Library JAR'**: [https://calypsonet.github.io/keyple-java/develop/jars/keyple-calypso-1.0.0-RC4.jar](https://calypsonet.github.io/keyple-java/develop/jars/keyple-calypso-1.0.0-RC4.jar)

Keyple plugins - simple archives:
 - **'Keyple PC/SC plugin JAR'**: to manage PC/SC readers on a PC environment supporting the # javax.smartcardio API[https://calypsonet.github.io/keyple-java/develop/jars/keyple-plugin-pcsc-1.0.0-RC4.jar](https://calypsonet.github.io/keyple-java/develop/jars/keyple-plugin-pcsc-1.0.0-RC4.jar)
- **'Keyple NFC Android plugin AAR'**: to operate the contactless reader of an Android Environment supporting the android.nfc API [https://calypsonet.github.io/keyple-java/develop/jars/keyple-plugin-android-nfc-1.0.0-RC4.aar](https://calypsonet.github.io/keyple-java/develop/jars/keyple-plugin-android-nfc-1.0.0-RC4.aar)
- **'Keyple OMAPI Android plugin AAR'**: to operate the internal contacts readers of an Android Environment supporting the OMAPI [https://calypsonet.github.io/keyple-java/develop/jars/keyple-plugin-android-omapi-1.0.0-RC4.aar](https://calypsonet.github.io/keyple-java/develop/jars/keyple-plugin-android-omapi-1.0.0-RC4.aar)
- **'Keyple "stub" plugin JAR'**: plugin to simulate the presence of fake readers with or without fake cards [https://calypsonet.github.io/keyple-java/develop/jars/keyple-plugin-stub-1.0.0-RC4.jar](https://calypsonet.github.io/keyple-java/develop/jars/keyple-plugin-stub-1.0.0-RC4.jar)

Keyple examples - FAT archive:
- **'FAT JAR of PC examples with dependencies'**: [https://calypsonet.github.io/keyple-java/develop/jars/keyple-example-pc-fat-1.0-SNAPSHOT.jar](https://calypsonet.github.io/keyple-java/develop/jars/keyple-example-pc-fat-1.0-SNAPSHOT.jar)

### Reference Keyple implementation examples
 - Three PC Java examples involving the PC/SC plugin:
    - Generic for any SE:  
      - 'KeypleGenericDemo_SeProtocolDetection' ( [https://github.com/calypsonet/keyple-java/blob/develop/keyple-example/pc/src/main/java/org/eclipse/keyple/example/pc/KeypleGenericDemo_SeProtocolDetection.java](https://github.com/calypsonet/keyple-java/blob/develop/keyple-example/pc/src/main/java/org/eclipse/keyple/example/pc/KeypleGenericDemo_SeProtocolDetection.java) ) ==> to detect the kind of SE presented on a contactless reader.
      - 'KeypleGenericDemo_ObservableReaderNotification' ( [https://github.com/calypsonet/keyple-java/blob/develop/keyple-example/pc/src/main/java/org/eclipse/keyple/example/pc/KeypleGenericDemo_ObservableReaderNotification.java](https://github.com/calypsonet/keyple-java/blob/develop/keyple-example/pc/src/main/java/org/eclipse/keyple/example/pc/KeypleGenericDemo_ObservableReaderNotification.java) ) ==> to observe the readers' configuration & SEs' status on a PC (notification of reader hot-plug/unplug, notification of SE insertion/removal).
    - Specific to Calypso, processing the Hoplink application
      -  'KeypleCalypsoDemo_HoplinkTransaction' ( [https://github.com/calypsonet/keyple-java/blob/develop/keyple-example/pc/src/main/java/org/eclipse/keyple/example/pc/KeypleCalypsoDemo_HoplinkTransaction.java](https://github.com/calypsonet/keyple-java/blob/develop/keyple-example/pc/src/main/java/org/eclipse/keyple/example/pc/KeypleCalypsoDemo_HoplinkTransaction.java) ) ==> in case of Hoplink card detection, operates 3 chained Calypso Secure Session with different settings:
         - first session : initial Hoplink selection & simple two steps secure session, without sendable in session PO commands, asking to keep the logical channel open,
         - second session : Using the same logical channel (no need of Hoplink selection) three steps secured session including several PO read or write commands sendable in session. The physical channel is closed at the end.
         - third session : new Hoplink selection, simple two steps secure session, & close of the physical channel.

## Status & current works 
- Coming during September 2018
  - The core API, Calypso library and the 4 available plugins are ready for a review by the Eclipse foundation, first step for the open source publication. The process may start mid of September.  
  - End of September : a first implemtation of 'Remote SE' plugin will be proposed with a demo application.

- **Week #36**:
  - PoSecureSession refactoring: PO & CSM opearations grouping in 3 messages both.
  - Logs refactoring
  -  SE selection by ATR value: allows to select a specific SE not supporting AID selection.
  - Stub reader settings to run the Calypso secure session demo without Calypso PO / CSM.
- **Week #27**:
  - Separation of the factorization library to support Reader Plugin implementations (dedicated package: 'org.eclipse.keyple.seproxy.plugin'), and simplification of the SE Proxy API for Keyple applications. Further the SE Proxy API for Keyple Application will stay static in case of plugin factorization library evolution.
- **Week #25**:
    - Improvement of the Code factorization for the implementation  of Reader Plugins ==> now the integration of a new proprietary plugin would require to just define native interfaces wrapping & specific parameters setting.
- **Week #24**:
  - Update of the Calypso Secured Session (org.eclipse.keyple.calypso.transaction.PoSecureSession) in order to support the new multi-SE request feature.
    - Improvement of the 'KeypleCalypsoDemo_HoplinkTransaction' PC Java example.
  - Improvements of the plugin abstract classes factorizing code for SE reader plugins ==> the amount of code required to implement a proprietary reader plugin is strongly reduced.
- **Week #23**:
  - Update of the Calypso Secured Session (org.eclipse.keyple.calypso.transaction.PoSecureSession) in order to support the new multi-SE request feature.
    - The third PC Java example 'KeypleCalypsoDemo_HoplinkTransaction' (operation a Calypso Secure Session in case a **Hoplink** test card is detected) will be fixed to support the multi-SE feature.
  - Improvements org.eclipse.keyple.seproxyAbstractObservableReader (to provide generic logging of SeRequest/SeResponse) and 
org.eclipse.keyple.seproxy.AbstractLocalReader (to factorize as possible the ApduRequest/ApduResponse processing between plugins of local readers).
- **Week #22**:
  - Finished a wide refactoring of the SE Proxy layer to requests for multi-SE.
  - Two PC Java examples are fully ready for the PC/SC plugin: KeypleGenericDemo_ObservableReaderNotification &  KeypleGenericDemo_SeProtocolDetection.

