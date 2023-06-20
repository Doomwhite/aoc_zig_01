const std = @import("std");

pub fn main() !void {
    var file = try std.fs.cwd().openFile("src/input.txt", .{});
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());

    var buf: [1024]u8 = undefined;

    var max: i32 = 0;
    // var current_elf_calories: i32 = 0;
    // var value: i32 = 0;
    while (try buf_reader.reader().readUntilDelimiterOrEof(&buf, '\n')) |line| {
        std.log.info("{s}", .{line});
        const value = std.fmt.parseInt(i32, line, 10) catch -1;
        if (value > max) {
            max = value;
        }
        std.log.info("Value: {d}", .{value});
    }
    std.log.info("Max value: {d}", .{max});
}
