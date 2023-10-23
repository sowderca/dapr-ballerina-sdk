import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.empty;

public const string APPCALLBACK_DESC = "0A27646170722F70726F746F2F72756E74696D652F76312F61707063616C6C6261636B2E70726F746F1215646170722E70726F746F2E72756E74696D652E76311A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F1A21646170722F70726F746F2F636F6D6D6F6E2F76312F636F6D6D6F6E2E70726F746F1A1C676F6F676C652F70726F746F6275662F7374727563742E70726F746F22B6020A11546F7069634576656E7452657175657374120E0A0269641801200128095202696412160A06736F757263651802200128095206736F7572636512120A047479706518032001280952047479706512210A0C737065635F76657273696F6E180420012809520B7370656356657273696F6E122A0A11646174615F636F6E74656E745F74797065180520012809520F64617461436F6E74656E745479706512120A046461746118072001280C52046461746112140A05746F7069631806200128095205746F706963121F0A0B7075627375625F6E616D65180820012809520A7075627375624E616D6512120A047061746818092001280952047061746812370A0A657874656E73696F6E73180A2001280B32172E676F6F676C652E70726F746F6275662E537472756374520A657874656E73696F6E7322AE010A12546F7069634576656E74526573706F6E7365125A0A0673746174757318012001280E32422E646170722E70726F746F2E72756E74696D652E76312E546F7069634576656E74526573706F6E73652E546F7069634576656E74526573706F6E73655374617475735206737461747573223C0A18546F7069634576656E74526573706F6E7365537461747573120B0A0753554343455353100012090A055245545259100112080A0444524F50100222ED010A13546F7069634576656E74434552657175657374120E0A0269641801200128095202696412160A06736F757263651802200128095206736F7572636512120A047479706518032001280952047479706512210A0C737065635F76657273696F6E180420012809520B7370656356657273696F6E122A0A11646174615F636F6E74656E745F74797065180520012809520F64617461436F6E74656E745479706512120A046461746118062001280C52046461746112370A0A657874656E73696F6E7318072001280B32172E676F6F676C652E70726F746F6275662E537472756374520A657874656E73696F6E7322E4020A1A546F7069634576656E7442756C6B52657175657374456E74727912190A08656E7472795F69641801200128095207656E747279496412160A05627974657318022001280C480052056279746573124D0A0B636C6F75645F6576656E7418032001280B322A2E646170722E70726F746F2E72756E74696D652E76312E546F7069634576656E744345526571756573744800520A636C6F75644576656E7412210A0C636F6E74656E745F74797065180420012809520B636F6E74656E7454797065125B0A086D6574616461746118052003280B323F2E646170722E70726F746F2E72756E74696D652E76312E546F7069634576656E7442756C6B52657175657374456E7472792E4D65746164617461456E74727952086D657461646174611A3B0A0D4D65746164617461456E74727912100A036B657918012001280952036B657912140A0576616C7565180220012809520576616C75653A02380142070A056576656E7422E8020A15546F7069634576656E7442756C6B52657175657374120E0A02696418012001280952026964124B0A07656E747269657318022003280B32312E646170722E70726F746F2E72756E74696D652E76312E546F7069634576656E7442756C6B52657175657374456E7472795207656E747269657312560A086D6574616461746118032003280B323A2E646170722E70726F746F2E72756E74696D652E76312E546F7069634576656E7442756C6B526571756573742E4D65746164617461456E74727952086D6574616461746112140A05746F7069631804200128095205746F706963121F0A0B7075627375625F6E616D65180520012809520A7075627375624E616D6512120A047479706518062001280952047479706512120A04706174681807200128095204706174681A3B0A0D4D65746164617461456E74727912100A036B657918012001280952036B657912140A0576616C7565180220012809520576616C75653A0238012294010A1B546F7069634576656E7442756C6B526573706F6E7365456E74727912190A08656E7472795F69641801200128095207656E7472794964125A0A0673746174757318022001280E32422E646170722E70726F746F2E72756E74696D652E76312E546F7069634576656E74526573706F6E73652E546F7069634576656E74526573706F6E7365537461747573520673746174757322680A16546F7069634576656E7442756C6B526573706F6E7365124E0A08737461747573657318012003280B32322E646170722E70726F746F2E72756E74696D652E76312E546F7069634576656E7442756C6B526573706F6E7365456E7472795208737461747573657322D0010A1342696E64696E674576656E745265717565737412120A046E616D6518012001280952046E616D6512120A046461746118022001280C52046461746112540A086D6574616461746118032003280B32382E646170722E70726F746F2E72756E74696D652E76312E42696E64696E674576656E74526571756573742E4D65746164617461456E74727952086D657461646174611A3B0A0D4D65746164617461456E74727912100A036B657918012001280952036B657912140A0576616C7565180220012809520576616C75653A02380122B2020A1442696E64696E674576656E74526573706F6E7365121D0A0A73746F72655F6E616D65180120012809520973746F72654E616D6512370A0673746174657318022003280B321F2E646170722E70726F746F2E636F6D6D6F6E2E76312E53746174654974656D5206737461746573120E0A02746F1803200328095202746F12120A046461746118042001280C52046461746112650A0B636F6E63757272656E637918052001280E32432E646170722E70726F746F2E72756E74696D652E76312E42696E64696E674576656E74526573706F6E73652E42696E64696E674576656E74436F6E63757272656E6379520B636F6E63757272656E637922370A1742696E64696E674576656E74436F6E63757272656E6379120E0A0A53455155454E5449414C1000120C0A08504152414C4C454C100122700A1E4C697374546F706963537562736372697074696F6E73526573706F6E7365124E0A0D737562736372697074696F6E7318012003280B32282E646170722E70726F746F2E72756E74696D652E76312E546F706963537562736372697074696F6E520D737562736372697074696F6E732296030A11546F706963537562736372697074696F6E121F0A0B7075627375625F6E616D65180120012809520A7075627375624E616D6512140A05746F7069631802200128095205746F70696312520A086D6574616461746118032003280B32362E646170722E70726F746F2E72756E74696D652E76312E546F706963537562736372697074696F6E2E4D65746164617461456E74727952086D65746164617461123A0A06726F7574657318052001280B32222E646170722E70726F746F2E72756E74696D652E76312E546F706963526F757465735206726F75746573122A0A11646561645F6C65747465725F746F706963180620012809520F646561644C6574746572546F70696312510A0E62756C6B5F73756273637269626518072001280B322A2E646170722E70726F746F2E72756E74696D652E76312E42756C6B537562736372696265436F6E666967520D62756C6B5375627363726962651A3B0A0D4D65746164617461456E74727912100A036B657918012001280952036B657912140A0576616C7565180220012809520576616C75653A023801225F0A0B546F706963526F7574657312360A0572756C657318012003280B32202E646170722E70726F746F2E72756E74696D652E76312E546F70696352756C65520572756C657312180A0764656661756C74180220012809520764656661756C7422350A09546F70696352756C6512140A056D6174636818012001280952056D6174636812120A04706174681802200128095204706174682290010A1342756C6B537562736372696265436F6E66696712180A07656E61626C65641801200128085207656E61626C6564122C0A126D61785F6D657373616765735F636F756E7418022001280552106D61784D65737361676573436F756E7412310A156D61785F61776169745F6475726174696F6E5F6D7318032001280552126D617841776169744475726174696F6E4D7322370A194C697374496E70757442696E64696E6773526573706F6E7365121A0A0862696E64696E6773180120032809520862696E64696E677322150A134865616C7468436865636B526573706F6E73653286040A0B41707043616C6C6261636B12570A084F6E496E766F6B6512232E646170722E70726F746F2E636F6D6D6F6E2E76312E496E766F6B65526571756573741A242E646170722E70726F746F2E636F6D6D6F6E2E76312E496E766F6B65526573706F6E7365220012690A164C697374546F706963537562736372697074696F6E7312162E676F6F676C652E70726F746F6275662E456D7074791A352E646170722E70726F746F2E72756E74696D652E76312E4C697374546F706963537562736372697074696F6E73526573706F6E7365220012650A0C4F6E546F7069634576656E7412282E646170722E70726F746F2E72756E74696D652E76312E546F7069634576656E74526571756573741A292E646170722E70726F746F2E72756E74696D652E76312E546F7069634576656E74526573706F6E73652200125F0A114C697374496E70757442696E64696E677312162E676F6F676C652E70726F746F6275662E456D7074791A302E646170722E70726F746F2E72756E74696D652E76312E4C697374496E70757442696E64696E6773526573706F6E73652200126B0A0E4F6E42696E64696E674576656E74122A2E646170722E70726F746F2E72756E74696D652E76312E42696E64696E674576656E74526571756573741A2B2E646170722E70726F746F2E72756E74696D652E76312E42696E64696E674576656E74526573706F6E73652200326D0A1641707043616C6C6261636B4865616C7468436865636B12530A0B4865616C7468436865636B12162E676F6F676C652E70726F746F6275662E456D7074791A2A2E646170722E70726F746F2E72756E74696D652E76312E4865616C7468436865636B526573706F6E73652200328B010A1041707043616C6C6261636B416C70686112770A164F6E42756C6B546F7069634576656E74416C70686131122C2E646170722E70726F746F2E72756E74696D652E76312E546F7069634576656E7442756C6B526571756573741A2D2E646170722E70726F746F2E72756E74696D652E76312E546F7069634576656E7442756C6B526573706F6E7365220042790A0A696F2E646170722E763142154461707241707043616C6C6261636B50726F746F735A316769746875622E636F6D2F646170722F646170722F706B672F70726F746F2F72756E74696D652F76313B72756E74696D65AA0220446170722E41707043616C6C6261636B2E4175746F67656E2E477270632E7631620670726F746F33";
public const map<string> APPCALLBACK_DESCRIPTOR_MAP = {"dapr/proto/common/v1/common.proto": DAPR_PROTO_COMMON_V1_COMMON_DESC};

public isolated client class AppCallbackClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, APPCALLBACK_DESC, APPCALLBACK_DESCRIPTOR_MAP);
    }

    isolated remote function OnInvoke(InvokeRequest|ContextInvokeRequest req) returns InvokeResponse|grpc:Error {
        map<string|string[]> headers = {};
        InvokeRequest message;
        if req is ContextInvokeRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallback/OnInvoke", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <InvokeResponse>result;
    }

    isolated remote function OnInvokeContext(InvokeRequest|ContextInvokeRequest req) returns ContextInvokeResponse|grpc:Error {
        map<string|string[]> headers = {};
        InvokeRequest message;
        if req is ContextInvokeRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallback/OnInvoke", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <InvokeResponse>result, headers: respHeaders};
    }

    isolated remote function ListTopicSubscriptions() returns ListTopicSubscriptionsResponse|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallback/ListTopicSubscriptions", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ListTopicSubscriptionsResponse>result;
    }

    isolated remote function ListTopicSubscriptionsContext() returns ContextListTopicSubscriptionsResponse|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallback/ListTopicSubscriptions", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ListTopicSubscriptionsResponse>result, headers: respHeaders};
    }

    isolated remote function OnTopicEvent(TopicEventRequest|ContextTopicEventRequest req) returns TopicEventResponse|grpc:Error {
        map<string|string[]> headers = {};
        TopicEventRequest message;
        if req is ContextTopicEventRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallback/OnTopicEvent", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <TopicEventResponse>result;
    }

    isolated remote function OnTopicEventContext(TopicEventRequest|ContextTopicEventRequest req) returns ContextTopicEventResponse|grpc:Error {
        map<string|string[]> headers = {};
        TopicEventRequest message;
        if req is ContextTopicEventRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallback/OnTopicEvent", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <TopicEventResponse>result, headers: respHeaders};
    }

    isolated remote function ListInputBindings() returns ListInputBindingsResponse|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallback/ListInputBindings", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ListInputBindingsResponse>result;
    }

    isolated remote function ListInputBindingsContext() returns ContextListInputBindingsResponse|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallback/ListInputBindings", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ListInputBindingsResponse>result, headers: respHeaders};
    }

    isolated remote function OnBindingEvent(BindingEventRequest|ContextBindingEventRequest req) returns BindingEventResponse|grpc:Error {
        map<string|string[]> headers = {};
        BindingEventRequest message;
        if req is ContextBindingEventRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallback/OnBindingEvent", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BindingEventResponse>result;
    }

    isolated remote function OnBindingEventContext(BindingEventRequest|ContextBindingEventRequest req) returns ContextBindingEventResponse|grpc:Error {
        map<string|string[]> headers = {};
        BindingEventRequest message;
        if req is ContextBindingEventRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallback/OnBindingEvent", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BindingEventResponse>result, headers: respHeaders};
    }
}

public isolated client class AppCallbackHealthCheckClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, APPCALLBACK_DESC, APPCALLBACK_DESCRIPTOR_MAP);
    }

    isolated remote function HealthCheck() returns HealthCheckResponse|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallbackHealthCheck/HealthCheck", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <HealthCheckResponse>result;
    }

    isolated remote function HealthCheckContext() returns ContextHealthCheckResponse|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallbackHealthCheck/HealthCheck", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <HealthCheckResponse>result, headers: respHeaders};
    }
}

public isolated client class AppCallbackAlphaClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, APPCALLBACK_DESC, APPCALLBACK_DESCRIPTOR_MAP);
    }

    isolated remote function OnBulkTopicEventAlpha1(TopicEventBulkRequest|ContextTopicEventBulkRequest req) returns TopicEventBulkResponse|grpc:Error {
        map<string|string[]> headers = {};
        TopicEventBulkRequest message;
        if req is ContextTopicEventBulkRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallbackAlpha/OnBulkTopicEventAlpha1", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <TopicEventBulkResponse>result;
    }

    isolated remote function OnBulkTopicEventAlpha1Context(TopicEventBulkRequest|ContextTopicEventBulkRequest req) returns ContextTopicEventBulkResponse|grpc:Error {
        map<string|string[]> headers = {};
        TopicEventBulkRequest message;
        if req is ContextTopicEventBulkRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("dapr.proto.runtime.v1.AppCallbackAlpha/OnBulkTopicEventAlpha1", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <TopicEventBulkResponse>result, headers: respHeaders};
    }
}

public client class AppCallbackTopicEventResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendTopicEventResponse(TopicEventResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextTopicEventResponse(ContextTopicEventResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class AppCallbackListInputBindingsResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendListInputBindingsResponse(ListInputBindingsResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextListInputBindingsResponse(ContextListInputBindingsResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class AppCallbackInvokeResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendInvokeResponse(InvokeResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextInvokeResponse(ContextInvokeResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class AppCallbackListTopicSubscriptionsResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendListTopicSubscriptionsResponse(ListTopicSubscriptionsResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextListTopicSubscriptionsResponse(ContextListTopicSubscriptionsResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class AppCallbackBindingEventResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBindingEventResponse(BindingEventResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBindingEventResponse(ContextBindingEventResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class AppCallbackHealthCheckHealthCheckResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendHealthCheckResponse(HealthCheckResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextHealthCheckResponse(ContextHealthCheckResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class AppCallbackAlphaTopicEventBulkResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendTopicEventBulkResponse(TopicEventBulkResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextTopicEventBulkResponse(ContextTopicEventBulkResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextBindingEventRequest record {|
    BindingEventRequest content;
    map<string|string[]> headers;
|};

public type ContextInvokeResponse record {|
    InvokeResponse content;
    map<string|string[]> headers;
|};

public type ContextTopicEventResponse record {|
    TopicEventResponse content;
    map<string|string[]> headers;
|};

public type ContextBindingEventResponse record {|
    BindingEventResponse content;
    map<string|string[]> headers;
|};

public type ContextInvokeRequest record {|
    InvokeRequest content;
    map<string|string[]> headers;
|};

public type ContextListTopicSubscriptionsResponse record {|
    ListTopicSubscriptionsResponse content;
    map<string|string[]> headers;
|};

public type ContextTopicEventRequest record {|
    TopicEventRequest content;
    map<string|string[]> headers;
|};

public type ContextListInputBindingsResponse record {|
    ListInputBindingsResponse content;
    map<string|string[]> headers;
|};

public type ContextHealthCheckResponse record {|
    HealthCheckResponse content;
    map<string|string[]> headers;
|};

public type ContextTopicEventBulkResponse record {|
    TopicEventBulkResponse content;
    map<string|string[]> headers;
|};

public type ContextTopicEventBulkRequest record {|
    TopicEventBulkRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type BindingEventRequest record {|
    string name = "";
    byte[] data = [];
    record {|string key; string value;|}[] metadata = [];
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type TopicRoutes record {|
    TopicRule[] rules = [];
    string 'default = "";
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type HealthCheckResponse record {|
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type TopicEventResponse record {|
    TopicEventResponse_TopicEventResponseStatus status = SUCCESS;
|};

public enum TopicEventResponse_TopicEventResponseStatus {
    SUCCESS, RETRY, DROP
}

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type TopicEventBulkRequest record {|
    string id = "";
    TopicEventBulkRequestEntry[] entries = [];
    string topic = "";
    string pubsub_name = "";
    string 'type = "";
    string path = "";
    record {|string key; string value;|}[] metadata = [];
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type TopicEventBulkResponseEntry record {|
    string entry_id = "";
    TopicEventResponse_TopicEventResponseStatus status = SUCCESS;
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type ListTopicSubscriptionsResponse record {|
    TopicSubscription[] subscriptions = [];
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type BulkSubscribeConfig record {|
    boolean enabled = false;
    int max_messages_count = 0;
    int max_await_duration_ms = 0;
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type TopicEventBulkRequestEntry record {|
    string entry_id = "";
    string content_type = "";
    byte[] bytes?;
    TopicEventCERequest cloud_event?;
    record {|string key; string value;|}[] metadata = [];
|};

isolated function isValidTopiceventbulkrequestentry(TopicEventBulkRequestEntry r) returns boolean {
    int eventCount = 0;
    if !(r?.bytes is ()) {
        eventCount += 1;
    }
    if !(r?.cloud_event is ()) {
        eventCount += 1;
    }
    if (eventCount > 1) {
        return false;
    }
    return true;
}

isolated function setTopicEventBulkRequestEntry_Bytes(TopicEventBulkRequestEntry r, byte[] bytes) {
    r.bytes = bytes;
    _ = r.removeIfHasKey("cloud_event");
}

isolated function setTopicEventBulkRequestEntry_CloudEvent(TopicEventBulkRequestEntry r, TopicEventCERequest cloud_event) {
    r.cloud_event = cloud_event;
    _ = r.removeIfHasKey("bytes");
}

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type TopicSubscription record {|
    string pubsub_name = "";
    string topic = "";
    TopicRoutes routes = {};
    string dead_letter_topic = "";
    BulkSubscribeConfig bulk_subscribe = {};
    record {|string key; string value;|}[] metadata = [];
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type TopicEventBulkResponse record {|
    TopicEventBulkResponseEntry[] statuses = [];
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type TopicEventCERequest record {|
    string id = "";
    string 'source = "";
    string 'type = "";
    string spec_version = "";
    string data_content_type = "";
    byte[] data = [];
    map<anydata> extensions = {};
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type BindingEventResponse record {|
    string store_name = "";
    StateItem[] states = [];
    string[] to = [];
    byte[] data = [];
    BindingEventResponse_BindingEventConcurrency concurrency = SEQUENTIAL;
|};

public enum BindingEventResponse_BindingEventConcurrency {
    SEQUENTIAL, PARALLEL
}

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type TopicRule record {|
    string 'match = "";
    string path = "";
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type TopicEventRequest record {|
    string id = "";
    string 'source = "";
    string 'type = "";
    string spec_version = "";
    string data_content_type = "";
    byte[] data = [];
    string topic = "";
    string pubsub_name = "";
    string path = "";
    map<anydata> extensions = {};
|};

@protobuf:Descriptor {value: APPCALLBACK_DESC}
public type ListInputBindingsResponse record {|
    string[] bindings = [];
|};

