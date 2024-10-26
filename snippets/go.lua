return {
    s({
        name = "Table Driven Test",
        trig = "TDT",
        desc = "Scaffold Table Driven Test",
    }, fmt([[
    func Test<>(t *testing.T) {
        testCases := []struct {
            desc string
            <>
        }{
            {
                desc: "<>",
                <>
            },
        }
        for _, tt := range testCases {
            t.Run(tt.desc, func(t *testing.T) {
                <>
            })
        }
    }
    ]], { i(1), i(2), i(3), i(4), i(0) },
    { delimiters = "<>" })),
}
