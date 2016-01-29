///////////////////////////////////////////////////////////////////////////////

#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#include "lex_basis.h"

///////////////////////////////////////////////////////////////////////////////

Char::Char(char val)
{
	m_val = val;
}

///////////////////////////////////////////////////////////////////////////////

Char::~Char()
{
}

///////////////////////////////////////////////////////////////////////////////

Match	Char::Parse(const char *buf)
{
	Match	retv;

	if( m_val == *buf ) {
		retv.ok(true);
		retv.length(1);
	}

	return retv;
}

///////////////////////////////////////////////////////////////////////////////

String::String(const char *val)
{
	m_val = ::strdup(val);
	m_length = ::strlen(val);
}

///////////////////////////////////////////////////////////////////////////////

String::~String()
{
	::free(m_val);
}

///////////////////////////////////////////////////////////////////////////////

Match	String::Parse(const char *buf)
{
	Match	retv;

	if( ::strncmp(m_val, buf, m_length) == 0 ) {
		retv.length(m_length);
		retv.ok(true);
	}

	return retv;
}

///////////////////////////////////////////////////////////////////////////////

Anychar::Anychar()
{
}

///////////////////////////////////////////////////////////////////////////////

Anychar::~Anychar()
{
}

///////////////////////////////////////////////////////////////////////////////

Match	Anychar::Parse(const char *buf)
{
	return Match(true, 1);
}

///////////////////////////////////////////////////////////////////////////////

Digit::Digit()
{
}

///////////////////////////////////////////////////////////////////////////////

Digit::~Digit()
{
}

///////////////////////////////////////////////////////////////////////////////

Match	Digit::Parse(const char *buf)
{
	Match	retv;

	if( (*buf >= '0') && (*buf <= '9') ) {
		retv.ok(true);
		retv.length(1);
	}

	return retv;
}

///////////////////////////////////////////////////////////////////////////////

Alpha::Alpha()
{
}

///////////////////////////////////////////////////////////////////////////////

Alpha::~Alpha()
{
}

///////////////////////////////////////////////////////////////////////////////

Match	Alpha::Parse(const char *buf)
{
	Match	retv;

	if( ((*buf >= 'a') && (*buf <= 'z')) || ((*buf >= 'A') && (*buf <= 'Z')) ) {
		retv.ok(true);
		retv.length(1);
	}

	return retv;
}

///////////////////////////////////////////////////////////////////////////////

Alnum::Alnum()
{
}

///////////////////////////////////////////////////////////////////////////////

Alnum::~Alnum()
{
}

///////////////////////////////////////////////////////////////////////////////

Match	Alnum::Parse(const char *buf)
{
	Match	retv;

	if( ((*buf >= 'a') && (*buf <= 'z')) ||
	    ((*buf >= 'A') && (*buf <= 'Z')) ||
	    ((*buf >= '0') && (*buf <= '9')) ) {
		retv.ok(true);
		retv.length(1);
	}

	return retv;
}

///////////////////////////////////////////////////////////////////////////////
