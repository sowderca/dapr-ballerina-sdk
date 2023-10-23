import ballerina/protobuf;
import ballerina/protobuf.types.'any;

public const string DAPR_PROTO_COMMON_V1_COMMON_DESC = "0A21646170722F70726F746F2F636F6D6D6F6E2F76312F636F6D6D6F6E2E70726F746F1214646170722E70726F746F2E636F6D6D6F6E2E76311A19676F6F676C652F70726F746F6275662F616E792E70726F746F22E3010A0D48545450457874656E73696F6E123C0A047665726218012001280E32282E646170722E70726F746F2E636F6D6D6F6E2E76312E48545450457874656E73696F6E2E5665726252047665726212200A0B7175657279737472696E67180220012809520B7175657279737472696E6722720A045665726212080A044E4F4E45100012070A03474554100112080A0448454144100212080A04504F5354100312070A035055541004120A0A0644454C4554451005120B0A07434F4E4E4543541006120B0A074F5054494F4E53100712090A055452414345100812090A055041544348100922C0010A0D496E766F6B655265717565737412160A066D6574686F6418012001280952066D6574686F6412280A046461746118022001280B32142E676F6F676C652E70726F746F6275662E416E7952046461746112210A0C636F6E74656E745F74797065180320012809520B636F6E74656E7454797065124A0A0E687474705F657874656E73696F6E18042001280B32232E646170722E70726F746F2E636F6D6D6F6E2E76312E48545450457874656E73696F6E520D68747470457874656E73696F6E225D0A0E496E766F6B65526573706F6E736512280A046461746118012001280B32142E676F6F676C652E70726F746F6275662E416E7952046461746112210A0C636F6E74656E745F74797065180220012809520B636F6E74656E745479706522350A0D53747265616D5061796C6F616412120A046461746118012001280C52046461746112100A03736571180220012804520373657122A9020A0953746174654974656D12100A036B657918012001280952036B657912140A0576616C756518022001280C520576616C7565122E0A046574616718032001280B321A2E646170722E70726F746F2E636F6D6D6F6E2E76312E4574616752046574616712490A086D6574616461746118042003280B322D2E646170722E70726F746F2E636F6D6D6F6E2E76312E53746174654974656D2E4D65746164617461456E74727952086D65746164617461123C0A076F7074696F6E7318052001280B32222E646170722E70726F746F2E636F6D6D6F6E2E76312E53746174654F7074696F6E7352076F7074696F6E731A3B0A0D4D65746164617461456E74727912100A036B657918012001280952036B657912140A0576616C7565180220012809520576616C75653A023801221C0A044574616712140A0576616C7565180120012809520576616C75652289030A0C53746174654F7074696F6E7312550A0B636F6E63757272656E637918012001280E32332E646170722E70726F746F2E636F6D6D6F6E2E76312E53746174654F7074696F6E732E5374617465436F6E63757272656E6379520B636F6E63757272656E637912550A0B636F6E73697374656E637918022001280E32332E646170722E70726F746F2E636F6D6D6F6E2E76312E53746174654F7074696F6E732E5374617465436F6E73697374656E6379520B636F6E73697374656E637922680A105374617465436F6E63757272656E6379121B0A17434F4E43555252454E43595F554E5350454349464945441000121B0A17434F4E43555252454E43595F46495253545F57524954451001121A0A16434F4E43555252454E43595F4C4153545F5752495445100222610A105374617465436F6E73697374656E6379121B0A17434F4E53495354454E43595F554E535045434946494544100012180A14434F4E53495354454E43595F4556454E5455414C100112160A12434F4E53495354454E43595F5354524F4E47100222D3010A11436F6E66696775726174696F6E4974656D12140A0576616C7565180120012809520576616C756512180A0776657273696F6E180220012809520776657273696F6E12510A086D6574616461746118032003280B32352E646170722E70726F746F2E636F6D6D6F6E2E76312E436F6E66696775726174696F6E4974656D2E4D65746164617461456E74727952086D657461646174611A3B0A0D4D65746164617461456E74727912100A036B657918012001280952036B657912140A0576616C7565180220012809520576616C75653A02380142690A0A696F2E646170722E7631420C436F6D6D6F6E50726F746F735A2F6769746875622E636F6D2F646170722F646170722F706B672F70726F746F2F636F6D6D6F6E2F76313B636F6D6D6F6EAA021B446170722E436C69656E742E4175746F67656E2E477270632E7631620670726F746F33";

@protobuf:Descriptor {value: DAPR_PROTO_COMMON_V1_COMMON_DESC}
public type ConfigurationItem record {|
    string value = "";
    string 'version = "";
    record {|string key; string value;|}[] metadata = [];
|};

@protobuf:Descriptor {value: DAPR_PROTO_COMMON_V1_COMMON_DESC}
public type InvokeResponse record {|
    'any:Any data = {};
    string content_type = "";
|};

@protobuf:Descriptor {value: DAPR_PROTO_COMMON_V1_COMMON_DESC}
public type StreamPayload record {|
    byte[] data = [];
    int seq = 0;
|};

@protobuf:Descriptor {value: DAPR_PROTO_COMMON_V1_COMMON_DESC}
public type Etag record {|
    string value = "";
|};

@protobuf:Descriptor {value: DAPR_PROTO_COMMON_V1_COMMON_DESC}
public type HTTPExtension record {|
    HTTPExtension_Verb verb = NONE;
    string querystring = "";
|};

public enum HTTPExtension_Verb {
    NONE, GET, HEAD, POST, PUT, DELETE, CONNECT, OPTIONS, TRACE, PATCH
}

@protobuf:Descriptor {value: DAPR_PROTO_COMMON_V1_COMMON_DESC}
public type StateOptions record {|
    StateOptions_StateConcurrency concurrency = CONCURRENCY_UNSPECIFIED;
    StateOptions_StateConsistency consistency = CONSISTENCY_UNSPECIFIED;
|};

public enum StateOptions_StateConcurrency {
    CONCURRENCY_UNSPECIFIED, CONCURRENCY_FIRST_WRITE, CONCURRENCY_LAST_WRITE
}

public enum StateOptions_StateConsistency {
    CONSISTENCY_UNSPECIFIED, CONSISTENCY_EVENTUAL, CONSISTENCY_STRONG
}

@protobuf:Descriptor {value: DAPR_PROTO_COMMON_V1_COMMON_DESC}
public type InvokeRequest record {|
    string method = "";
    'any:Any data = {};
    string content_type = "";
    HTTPExtension http_extension = {};
|};

@protobuf:Descriptor {value: DAPR_PROTO_COMMON_V1_COMMON_DESC}
public type StateItem record {|
    string key = "";
    byte[] value = [];
    Etag etag = {};
    StateOptions options = {};
    record {|string key; string value;|}[] metadata = [];
|};
