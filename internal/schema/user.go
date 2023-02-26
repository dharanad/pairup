package schema

type UUID string

type User struct {
	Id        UUID
	Username  string
	FirstName string
	LastName  string
	Email     string
}

type UserLogin struct {
	UserId   UUID
	Password string
}
