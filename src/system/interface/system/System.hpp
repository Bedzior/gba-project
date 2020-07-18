#pragma once

#include <stdint.h>
#include <time.h>

class System {
public:
    explicit System();
    ~System() = default;

    System(const System&) = delete;
    System(System&&) = delete;

    uint64_t get_ticks_since_start() const;
    uint64_t get_seconds_since_start() const;

private:
    uint64_t _start{0};

    bool _initialized{false};
};
