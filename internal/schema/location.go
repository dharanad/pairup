package schema

type Location struct {
	Id     UUID
	Name   string
	CityId UUID
}

type City struct {
	ID   UUID
	Name string
}
