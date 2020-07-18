#include "System.hpp"

#include <stdlib.h>


System::System()
    : _start(clock())
{
    if (_start >= 0) {
        _initialized = true;
    } else {
        exit(1);
    }
}

uint64_t System::get_ticks_since_start() const
{
    return clock() - _start;
}

uint64_t System::get_seconds_since_start() const
{
    return get_ticks_since_start() / CLOCKS_PER_SEC;
}
