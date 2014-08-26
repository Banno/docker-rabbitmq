#!/bin/bash

ERLANG_COOKIE_PATH=$HOME/.erlang.cookie

rm -rf $ERLANG_COOKIE_PATH
cp .erlang.cookie $ERLANG_COOKIE_PATH
chmod 400 $ERLANG_COOKIE_PATH
