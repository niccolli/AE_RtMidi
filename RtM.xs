#include "RtMidi.h"

#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif

#include "ppport.h"

MODULE = RtM		PACKAGE = RtM		


RtMidiIn *
RtMidiIn::new()

void
RtMidiIn::openPort(sv,pv)
	SV *sv;
	SV *pv;
	CODE:
		THIS->openPort(SvIV(sv), SvPV_nolen(pv));
		

void
RtMidiIn::openVirtualPort(sv)
	SV *sv;
	CODE:
		THIS->openVirtualPort( SvPV_nolen(sv) );

void
RtMidiIn::setCallback(sv)
	SV *sv;
	CODE:
		THIS->setCallback( SvRV(sv) );

void
RtMidiIn::cancelCallback()

void
RtMidiIn::closePort()

SV *
RtMidiIn::getPortCount()
	PREINIT:
		unsigned int c;
	CODE:
		c = THIS->getPortCount();
		RETVAL = newSViv( c );
	OUTPUT:
		RETVAL


SV *
RtMidiIn::getPortName(sv)
	SV *sv;
	PREINIT:
		std::string s;
	CODE:
		s = THIS->getPortName( SvIV(sv) );
		RETVAL = newSVpv( s.c_str(), s.length() );
	OUTPUT:
		RETVAL


void
RtMidiIn::DESTROY()


