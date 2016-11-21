PEOPLE_HASH = [
    { forename: 'Daenerys',
      surname: 'Targaryen',
      middleName: 'Khaleesi',
      dateOfBirth: '1947-06-29',
      id: '1'
    },
    { forename: 'Arya',
      surname: 'Stark',
      middleName: 'The Blind Girl',
      dateOfBirth: '1954-01-12',
      id: '2'
    }
]

PERSON_ONE_HASH = { people: [
    { id: '1',
      name: 'Member1'
    }
] }


PEOPLE_JSON_LD = "{\"@graph\":[{\"@id\":\"http://id.example.com/1\",\"http://id.example.com/schema/dateOfBirth\":{\"@value\":\"1947-06-29\",\"@type\":\"http://www.w3.org/2001/XMLSchema#date\"},\"http://id.example.com/schema/forename\":\"Daenerys\",\"http://id.example.com/schema/middleName\":\"Khaleesi\",\"http://id.example.com/schema/surname\":\"Targaryen\"},{\"@id\":\"http://id.example.com/2\",\"http://id.example.com/schema/dateOfBirth\":{\"@value\":\"1954-01-12\",\"@type\":\"http://www.w3.org/2001/XMLSchema#date\"},\"http://id.example.com/schema/forename\":\"Arya\",\"http://id.example.com/schema/middleName\":\"The Blind Girl\",\"http://id.example.com/schema/surname\":\"Stark\"}]}"

PERSON_ONE_TTL = "<http://id.example.com/1> <http://id.example.com/schema/forename> \"Daenerys\" .\n <http://id.example.com/1> <http://id.example.com/schema/surname> \"Targaryen\" .\n <http://id.example.com/1> <http://id.example.com/schema/middleName> \"Khaleesi\" .\n <http://id.example.com/1> <http://id.example.com/schema/dateOfBirth> \"1947-06-29\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"
PEOPLE_TTL = "<http://id.example.com/1> <http://id.example.com/schema/forename> \"Daenerys\" .\n <http://id.example.com/1> <http://id.example.com/schema/surname> \"Targaryen\" .\n <http://id.example.com/1> <http://id.example.com/schema/middleName> \"Khaleesi\" .\n <http://id.example.com/1> <http://id.example.com/schema/dateOfBirth> \"1947-06-29\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.example.com/2> <http://id.example.com/schema/forename> \"Arya\" .\n <http://id.example.com/2> <http://id.example.com/schema/surname> \"Stark\" .\n <http://id.example.com/2> <http://id.example.com/schema/middleName> \"The Blind Girl\" .\n <http://id.example.com/2> <http://id.example.com/schema/dateOfBirth> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"

PEOPLE_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(PEOPLE_TTL) do |reader|
    reader.each_statement do |statement|
        PEOPLE_GRAPH << statement
    end
end

PERSON_ONE_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(PERSON_ONE_TTL) do |reader|
    reader.each_statement do |statement|
        PERSON_ONE_GRAPH << statement
    end
end

ONE_STATEMENT_STUB = RDF::Statement.new(RDF::URI.new("http://id.example.com/1"), RDF::URI.new("http://id.example.com/schema/forename"), 'Daenerys')

PARTY_ONE_TTL = "<http://id.example.com/ff0e8e9f-6c5d-4fd4-928c-3252b49a2e65> <http://id.example.com/schema/partyName> \"Liberal Democrat\" ."
PARTY_ONE_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(PARTY_ONE_TTL) do |reader|
    reader.each_statement do |statement|
        PARTY_ONE_GRAPH << statement
    end
end

PARTY_AND_PARTY_MEMBERSHIP_ONE_TTL = "<http://id.example.com/23> <http://id.example.com/schema/partyName> \"Targaryens\" .\n <http://id.example.com/23> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://id.example.com/schema/DummyParty> .\n <http://id.example.com/25> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://id.example.com/schema/DummyPartyMembership> .\n <http://id.example.com/25> <http://id.example.com/schema/partyMembershipHasParty> <http://id.example.com/23> .\n <http://id.example.com/25> <http://id.example.com/schema/partyMembershipEndDate> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.example.com/25> <http://id.example.com/schema/partyMembershipStartDate> \"1953-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"
PARTY_AND_PARTY_MEMBERSHIP_ONE_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(PARTY_AND_PARTY_MEMBERSHIP_ONE_TTL) do |reader|
    reader.each_statement do |statement|
        PARTY_AND_PARTY_MEMBERSHIP_ONE_GRAPH << statement
    end
end

CONTACT_POINT_TTL = "<http://id.example.com/123> <http://id.example.com/postalCode> \"SW1A 0AA\" .\n <http://id.example.com/123> <http://id.example.com/email> \"daenerys@khaleesi.com\" .\n <http://id.example.com/123> <http://id.example.com/streetAddress> \"House of Commons\" .\n <http://id.example.com/123> <http://id.example.com/addressLocality> \"London\" .\n <http://id.example.com/123> <http://id.example.com/telephone> \"020 7555 5555\" .\n"

PARTY_MEMBERSHIP_TTL = "<http://id.example.com/25> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://id.example.com/schema/DummyPartyMembership> .\n <http://id.example.com/25> <http://id.example.com/schema/partyMembershipHasParty> <http://id.example.com/23> .\n <http://id.example.com/25> <http://id.example.com/schema/partyMembershipEndDate> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.example.com/25> <http://id.example.com/schema/partyMembershipStartDate> \"1953-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"

PARTY_MEMBERSHIP_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(PARTY_MEMBERSHIP_TTL) do |reader|
    reader.each_statement do |statement|
        PARTY_MEMBERSHIP_GRAPH << statement
    end
end

NO_TYPE_PARTY_MEMBERSHIP_TTL = "<http://id.example.com/25> <http://id.example.com/schema/partyMembershipEndDate> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.example.com/25> <http://id.example.com/schema/partyMembershipStartDate> \"1953-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"

NO_TYPE_PARTY_MEMBERSHIP_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(NO_TYPE_PARTY_MEMBERSHIP_TTL) do |reader|
    reader.each_statement do |statement|
        NO_TYPE_PARTY_MEMBERSHIP_GRAPH << statement
    end
end

CAT_ONE_TTL = "<http://id.example.com/123> <http://id.example.com/schema/name> \"Bob\""
