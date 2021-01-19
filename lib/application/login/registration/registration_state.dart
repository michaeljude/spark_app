abstract class RegistrationState{}

class RegistrationInitialState extends RegistrationState{}

class RegistrationLoadingState extends RegistrationState{}
class RegistrationSuccessfullyCreated extends RegistrationState{}
class RegistrationFailed extends RegistrationState{}