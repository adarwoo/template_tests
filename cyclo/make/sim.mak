# Make rules specific to the simulator

tc_prefix:=
CPPFLAGS = -D_POSIX
LDFLAGS += -pthread

ifdef DEBUG
  CPPFLAGS += -DDEBUG
  CFLAGS += \
    -fsanitize=address \
    -fsanitize=alignment \
    -fno-omit-frame-pointer \
	-O$(if $(DEBUG),0,3)

  LDFLAGS += -lrt -fsanitize=address -fsanitize=alignment -static-libasan -static-libstdc++
endif

OBJS = $(foreach file, $(SRCS.common) $(SRCS.sim), $(BUILD_DIR)/$(basename $(file)).o)