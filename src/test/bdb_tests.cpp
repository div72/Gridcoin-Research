#include <boost/test/unit_test.hpp>

#include "db.h"

BOOST_AUTO_TEST_SUITE(bdb_tests)

BOOST_AUTO_TEST_CASE(verify_version_match)
{
    int major, minor;
    db_version(&major, &minor, nullptr);

    BOOST_CHECK_EQUAL(major, DB_VERSION_MAJOR);
    BOOST_CHECK_EQUAL(minor, DB_VERSION_MINOR);
}

BOOST_AUTO_TEST_SUITE_END()
