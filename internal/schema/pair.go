package schema

import "time"

type Pair struct {
	firstUserId    UUID
	secondUserId   UUID
	locationId     UUID
	visitTimestamp time.Time
	pairName       string
}

type TimeRange struct {
	start time.Time
	end   time.Time
}

type PairRequest struct {
	Id             UUID
	UserId         UUID
	LocationId     UUID
	visitTimeRange TimeRange
}
