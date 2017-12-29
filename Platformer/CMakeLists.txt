cmake_minimum_required(VERSION 3.10)
project(Platformer)


include_directories(SDL2/include/SDL2)


set(CMAKE_C_STANDARD 99)

add_executable(main main.c)
target_link_libraries(SDL2Test ${SDL2_LIBRARIES})