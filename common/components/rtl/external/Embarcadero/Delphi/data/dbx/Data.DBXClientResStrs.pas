{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2013 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXClientResStrs;

interface

resourcestring
  SAreYouSurePolicy = 'Are you sure you want to delete the access policy from line %d ?';
  SNewPolicyCaption = 'New access policy';
  SMaxSizeBlock = 'File content exceeds the current block size limit of 4 MB';
  SMaxSize = 'Block blob content is limited to maximum 64 MB';
  SAzureBlobs = 'Azure Blobs';
  SNodeLoading = 'Loading...';
  SACL = 'Access Control List';
  SPageRegions = 'Page Regions';
  SBlockList = 'Block List';
  SMetadata = 'Metadata';
  SProperties = 'Properties';
  SSignedIdentifier = 'Signed Identifier';
  SBlobPublicAccess = 'Blob Public Access';
  SContentLength = 'Content Length';
  SCommittedBlocks = 'Committed Blocks';
  SUncommittedBlocks = 'Uncommitted Blocks';
  SCreateRootContainer = 'Create Root Container';
  SCreateContainer = 'Create Container';
  SRefresh = 'Refresh';
  SActivate = 'Activate';
  SDeleteRootContainer = 'Delete Root Container';
  SRootContainerDeleteFailure = 'Root Container deletion failed with code: %d. A possible solution is to try again after a refresh.';
  SRootContainerCreateFailure = 'Root Container creation failed with code: %d. A possible solution is to try again after a refresh.';
  SContainerCreateFailure = 'Container''s %s creation failed with code: %d';
  SCreateRootContainerTitle = 'Create root container';
  SCreateNewContainerTitle = 'Create a new container';
  SCreateBlockBlob = 'Create Block Blob';
  SCreatePageBlob = 'Create Page Blob';
  SCreateBlockBlobCaption = 'Create a Block Blob in %s container';
  SCreatePageBlobCaption = 'Create a Page Blob in %s container';
  SLongTimeOperation = 'Please allow 10 minutes per MB for the operation to complete';
  SAreYouSure = 'You are about to delete of %s %s. Proceed with it?';
  SRootContainer = 'root container';
  SContainer = 'container';
  SBlob = 'blob';
  SBlobPageItem = 'Add Page';
  SBlobPageCaption = 'Page management for %s/%s blob';
  SBlobBlockItem = 'Add Block';
  SBlobBlockCaption = 'Block management for %s/%s blob';
  SDeleteContainer = 'Delete Container';
  SDeleteBlob = 'Delete Blob';
  SDeleteContainerMsg = 'You are about to delete the %s container and all its content. Proceed with the deletion?';
  SDeleteBlobMsg = 'You are about to delete the blob %s from the %s container. Proceed with the deletion?';
  SDeleteContainerFailure = 'Container %s deletion failed with code %d.';
  SDeleteBlobFailure = 'Blob %s/%s deletion attempt failed with code %d.';
  SIsBusy = 'No more new operations are allowed until the completion of the previous one';
  SIsBusyItem = 'Busy...';
  SMetadataItem = 'Edit Metadata';
  SMetadataBlobFailure = 'Blob''s %s/%s metadata access failed. Error code is: %d.';
  SMetadataBlobCaption = 'Edit Blob %s/%s Metadata';
  SMetadataContainerFailure = 'Container''s %s metadata access failed. Error code is: %d.';
  SMetadataContainerCaption = 'Edit Container %s Metadata';
  SPropertiesFailure = 'Accessing the properties of %s/%s blob failed. Error code is: %d.';
  SPropertiesCaption = 'Properties of %s/%s';
  SACLItem = 'Edit Access Control List';
  SSnapshotItem = 'Create Snapshot';
  SSnapshotCaption = 'Create snapshot of %s/%s';
  SCopyBlob = 'Copy';
  SCopyBlobCaption = 'Copy blob %s/%s into...';
  SDestContainerNotFound = 'The destination container %s cannot be found. You can create it or refresh the storage content';
  SDownloadItem = 'Download';
  SOverrideFile = 'Are you sure you want to change the content of %s?';
  SCommitBlockList = 'Commit Block List';
  SCommitBlockListCaption = 'Commit block list for blob %s/%s';
  SCommitBlockListFailure = 'Committing the block list of %s/%s failed. Error code is: %d.';
  SBlockListIsEmpty = 'The block list is empty for blob %s/%s. Please use %s to add blocks into it and then commit them.';
  SLeaseItem = 'Lease...';
  SLeaseAcquire = 'Acquire';
  SCopyLeaseId = 'Copy Lease ID';
  SLeaseRenew = 'Renew';
  SLeaseRelease = 'Release';
  SLeaseBreak = 'Break';
  SLeaseAcquireNotice = 'Lease on %s/%s is aquired for %d seconds';
  SLeaseBreakNotice = 'Lease on %s/%s is broken, a new lease can be acquired in %d seconds';
  SLeaseRenewNotice = 'Lease on %s/%s is renewed for another %d seconds';
  SLeaseReleaseNotice = 'Lease on %s/%s is released';
  SUpdateBlockBlob = 'Update Blob Content';
  SUpdateBlockBlobCaption = 'Update blob''s %s/%s content';
  SErrorGeneric = 'Cloud access error. ';
  SOKUpdateCaption = 'Update';
  SOKCreateCaption = 'Create';
  SNodeAzureQueueRoot = 'Azure Queues';
  SMoreMessages = 'Plus %d More...';
  SAddQueue = 'Add Queue';
  SRemoveQueue = 'Remove Queue';
  SQueueMetadataTitle = 'Azure Queue Metadata';
  SQueueMetadata = 'Queue Metadata';
  SClearQueueMessages = 'Clear Messages';
  SAddMessage = 'Add Message';
  SRemoveMessage = 'Remove Message';
  SAddQueueError = 'Failed to add Queue: %s';
  SQueueMetadataError = 'Queue Metadata operation failed for: %s';
  SDeleteQueueError = 'Failed to remove Queue: %s';
  SAddQueueTitle = 'Add Queue';
  SAddQueueMessage = 'Enter New Queue Name:';
  SAddMsgTitle = 'Add Message';
  SAddMsgMessage = 'Enter Message:';
  SAddQueueMessageError = 'Failed to add Message to Queue: %s';
  SRemoveQueueMessageError = 'Failed to remove Message(s) from Queue: %s';
  SNodeAzureTableRoot = 'Azure Tables';
  SAddTableMessage = 'Enter New Table Name:';
  SAddTable = 'Add Table';
  SRemoveTable = 'Delete Table';
  SViewTableData = 'View Data';
  SAddTableError = 'Failed to add Table: %s';
  SDeleteTableError = 'Failed to remove Table: %s';
  STableEditorTitle = 'Azure Table Editor';
  STableEditorTitle2 = 'Azure Table Editor: %s';
  SMoreTables = 'Load More';
  SNewEntityTitle = '[new entity]';
  SAddTableEntity = 'Add Entity';
  SDeleteTableEntity = 'Delete Entity';
  SDeleteEntityError = 'Failed to remove Entity: %s';
  SAddEntityError = 'Failed to add Entity';
  SUpdateEntityError = 'Failed to update Entity';
  SImportTableEntities = 'Import Entities';
  SImportEntitiesError = 'One or more Entities were not imported.';
  SEntityTitle = 'Entity: %s';
  SBadColumnName = 'The specified name cannot be used.';
  SColumnNameInUse = 'That name is already in use by another column.';
  SAddColumn = 'Add a Property';
  SDeleteColumn = 'Delete Property';
  SDataTypeItem = 'Data Type';
  SEditColumn = 'Edit Property';
  SNoColumnModify = 'You may not modify %s';
  SDeleteConfirm = 'Are you sure you want to delete this item?';
  SDeleteConfirmPlural = 'Are you sure you want to delete these items?';
  SInvalidDataType = 'Value is not a valid %s';
  SInvalidColumnName = 'Provided Name contains invalid characters.';
  SAddPropertyTitle = 'Add Property';
  SAddPropertyMessage = 'Enter the new property''s name';
  SPropertNameExistsError = 'A Property with name ''%s'' already exists.';
  SConfirmRowChangeLoss = 'Continue and lose current changes?';
  SResultsTruncated = 'Results Truncated...';
  SSharedKeyError = 'The shared key cannot be created. Please check that you have the required OpenSSL libraries.';
  SMissingServerSettings = 'Cannot connect %s to server, SQLConnection and ServerClassName must both be set.';
  sUnknownCommandType = 'Unknown command type';
  SNumberFormatError            = 'The parameter has an invalid number format';
  SInvalidDatasnapServerContext = 'Expected datasnap context in request %s';
  SInvalidTunnel = 'The callback tunnel is in an invalid state and should be terminated.';
  SProtocolNotSupported         = 'Specified protocol in request %s is not supported. Current supported protocols are: %s, json, tunnel';
  SProtocolRestEmpty            = 'none specified (uses rest)';
  SCommandNotSupported          = 'Command %s in request is not supported. Accepted commands are: GET, POST, PUT and DELETE';
  SProtocolCommandNotSupported  = 'Command %s in request is not supported. Accepted commands are: GET, POST and PUT';
  SNoServerData                 = 'Server stopped sending data. The connection was terminated or connection timeout.';
  SUnknownType = 'Unknown data type for parameter %d: %d';
  SUnknownTypeName = 'Unknown data type: %s';
  SOnGetClassNotSet = 'OnGetClass event not set or it did not provide a class reference';
  SInvalidRequest       = 'Invalid request format. (%s)';
  SInvalidRequestFormat = 'Invalid request format. /className/methodName and eventual parameters expected.';
  STooManyParameters    = 'Server method %0:s has only %1:d parameters. Too many arguments actual arguments: %2:d.';
  SNotInputParameter    = 'Server''s method %0:s %1:d parameter in not an input parameter. Either call with less parameters or change method definition.';
  SNoJSONValue          = 'Message content is not a valid JSON value.';
  SInvalidInternalCmd   = 'Internal command %s not implemented.';
  SNoConversionToDBX    = 'Cannot convert JSON value %0:s input into %1:s';
  SNoJSONConversion     = 'No conversion exists for JSON value %0:s';
  SNoConversionToJSON   = 'Cannot convert DBX type %0:s into a JSON value';
  STooManyInputParams   = 'Server method %0:s consumed only %1:d input parameters out of %2:d. Decrease the call input parameters for a successful execution.';
  SNoJSONCmdContent     = 'Request type %0:s has an empty content. A JSON command object is expected';
  SPOSTExpected         = 'JSON protocol expects a POST request instead of %0:s. Submit a POST request with a JSON command to receive proper response';
  SJSONArrayExpected    = 'JSON protocol expects a JSON array instead a %0:s type. Submit a POST request with a JSON command to receive proper response';
  SNoSessionFound       = 'Session expired';
  SNoSessionInRequest   = 'HTTP request is missing the session parameter. Add %s parameter with the session id.';
  SNoCountParam         = 'HTTP request misses the count parameter. Add %s parameter holding the byte count.';
  SCommunicationErr     = 'Error redirecting byte flow to internal server.';
  SWaitFailure          = 'Error in method %s while waiting for a semaphore.';
  SWaitTimeout          = 'Timeout occured in method %s while waiting for a semaphore.';
  SWaitTerminated       = 'Communication was terminated.';
  SBadParamName         = 'Invalid parameter naming. Expected [dcname.]field[numeric range] instead of %s';
  SConflictQueryParam   = 'Query parameters are conflicting. This is usually due to references on the same output parameter';
  SCannotConvertParam   = 'The output parameter (%d) cannot be converted by the selected converter (%s)';
  SCannotProcessParam   = 'Query parameter %0:s (%1:s) is not accepted as a valid converter. The converter type might not be registered yet hence the request is rejected';
  SJSONValueNotObject   = 'Value must be an instance of TJSONObject';
  SCommandNotImplemented = 'Command %s not implemented';
  SNoRegisteredCallbackForId = 'Invocation failed as there is currently no registered callback for the given id (%s)';
  SRegisteredCallbacksExist = 'Channel is terminated while %d are still registered with it';
  SAuthenticationFailed = 'Authentication manager rejected user credentials. This may due to invalid combination of DS user name and password';
  SSessionExpiredTitle = 'Session has expired';
  SSessionExpiredMsg = 'The specified session has expired due to inactivity or was an invalid Session ID';
  SServerClassExists = '%s class has already been added to the server class list';
  SServerClassMissing = '%s class not found in the server class list';
  SServerMethodMissing = '%s method not found in the server method list';
  SCloseCommands = 'All open command objects must be close before changing the server connection';
  SInvalidCommandHandle = 'Invalid command handle:  %s';
  SUnrecognizedCommandType = '%s is an unrecognized command type';
  SServerMethodExists = '%s method has already been added to the server method list';
  SCommandClosed = 'Command closed or executed again';
  SAuthorizationFail = '%s is not authorized to perform the requested action.';
  SAuthSessionFail = 'The current session does not have permission to perform the requested action.';
  SRemoteError = 'Remote error: %s';
  SCommandUnassigned = 'Command closed or unassigned.';
  SRESTServiceMissing = 'An appropriate REST Service was not specified.';
  SNoCachItem = 'There is no cached item with ID: %d';
  SNoCacheParameter = 'There is no parameter for command %d, parameter index %d.';
  SConError = 'Connection cannot be nil.  Make sure the connection has been opened.';
  SProtocolErrorJSON    = 'Invalid response: cannot parse %s.';
  SProtocolErrorWrite   = 'Cannot write %d bytes. Only %d were delivered.';
  SProtocolErrorSize    = 'Response size (%d bytes) is greater than expected (%d bytes).';
  SConnectionLost       = 'Connection lost';
  ParameterNotSet       = 'Parameter not set for column number %d';
  SNoRegisteredLayer    = 'Protocol %0:s can be used after an adequate instance of %1:s is registered with %2:s.';
  SConnectionTimeout    = 'Connection timeout error';
  SCommunicationTimeout = 'Communication timeout error';
  SNotImplemented  = 'Feature not implemented';
  SCertExpired     = 'The certificate has expired.';
  SCertNotYetValid = 'The certificate is not yet valid.';
  SCausedBy = #$a'Caused by: %s';
  SNeedsPrepare = 'Commands with output values must be prepared';
  SCallbackBadInput = 'Callback input argument cannot be parsed properly. This is due to a parser error or the server side-serialization';
  SBadCallbackParameter = 'A callback parameter cannot be found at the provided index';
  SNotEnoughReaders = 'Command needs more DBXReader parameters';
  SInvalidMetadataMessageFormat = 'Invalid metadata message format';
  SCallbackArgParseError = 'Cannot parse properly the callback output argument';
  SInvalidCallbackMessageFormat = 'Invalid callback message format';
  SMetadataParseError = 'Cannot parse properly the metadata value';
  SCannotLoadMetaDataForJds7 = 'MetaData cannot be provided from a Blackfish SQL server older than version 8.0';
  SInvalidJSONHeaderByte = 'Invalid JSON header byte encountered';
  SCloseError = 'Close error';
  SReadError = 'Read error';
  SUnexpectedHeader = 'Unexpected header';
  SKeyNotNull = 'Encryption key expected to be not null';
  SSetupFirst = 'Cypher filter needs to be setUp first';
  SNoSpaceAvailable = 'Operation %s cannot complete since it expects a container for at least %s bytes instead of %s';
  SKeyDoNotMatch = 'Cypher keys do not match, please use the same key';
  SNoReadDataAvailable = 'Read attempt when no read data is available';
  SNoWriteDataAvailable = 'Write attempt when write data is already available';
  SFilterNotRegistered = 'Communication filter %s is not registered. Filter class needs to be registered in order to communicate with the server.';
  SInvalidFilterParameter = 'Filter %s rejected setup parameter %s given value %s. At this point the server communication is not possible due to this incompatibility.';
  SNoConnection = 'No connection';
  SNoMatchingFilter = 'The Server has no matching %s filter.';
  SAzureInvalidAcctKey = 'The Account Key you have entered is invalid.';
  sCannotChangeIPImplID = 'IPImplementationID cannot be change while transport is active';

implementation

end.
