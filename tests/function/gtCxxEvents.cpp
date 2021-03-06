#include "gtest/gtest.h"

#include "opae/cxx/core/events.h"
#include "opae/cxx/core/handle.h"
#include "opae/cxx/core/token.h"

#include <fcntl.h>

using namespace opae::fpga::types;

class LibopaecppEventCommonALL_f1 : public ::testing::Test {
 protected:
  LibopaecppEventCommonALL_f1() {}

  virtual void SetUp() override {
    tokens_ = token::enumerate({properties::get(FPGA_ACCELERATOR)});
    ASSERT_GT(tokens_.size(), 0);
    accel_ = handle::open(tokens_[0], 0);
    ASSERT_NE(nullptr, accel_.get());
  }

  virtual void TearDown() override {
    accel_.reset();
    ASSERT_NO_THROW(tokens_.clear());
  }

  std::vector<token::ptr_t> tokens_;
  handle::ptr_t accel_;
};

/**
 * @test register_event_01
 * Given an open accelerator handle object<br>
 * When I call event::register_event() with that handle<br>
 * And event type of event::type_t::error
 * Then no exception is thrown<br>
 * And I get a non-null event shared pointer<br>
 */
TEST_F(LibopaecppEventCommonALL_f1, register_event_01) {
  event::ptr_t ev;
  ASSERT_NO_THROW(ev = event::register_event(accel_, event::type_t::error));
  ASSERT_NE(nullptr, ev.get());
}

/**
 * @test register_event_02
 * Given an open accelerator handle object<br>
 * When I call event::register_event() with that handle<br>
 * And event type of FPGA_EVENT_ERROR
 * Then no exception is thrown<br>
 * And I get a non-null event shared pointer<br>
 */
TEST_F(LibopaecppEventCommonALL_f1, register_event_02) {
  event::ptr_t ev;
  ASSERT_NO_THROW(ev = event::register_event(accel_, FPGA_EVENT_ERROR););
  ASSERT_NE(nullptr, ev.get());
}

/**
 * @test get_os_object
 * Given an open accelerator handle object<br>
 * And an event object created with event::register_event()<br>
 * When I call event::os_object using the event object<br>
 * Then I get a valid file descriptor for polling on the event<br>
 */
TEST_F(LibopaecppEventCommonALL_f1, get_os_object) {
  event::ptr_t ev;
  ASSERT_NO_THROW(ev = event::register_event(accel_, FPGA_EVENT_ERROR););
  ASSERT_NE(nullptr, ev.get());
  auto fd = ev->os_object();
  auto res = fcntl(fd, F_GETFL);
  ASSERT_NE(res, -1);
}
