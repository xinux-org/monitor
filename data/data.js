const graphData = [
   {
      "history" : [
         [
            "d74a2335ac9c133d6bbec9fc98d91a77f1604c1f",
            "2025-02-18T00:52:19Z"
         ]
      ],
      "name" : "nixos-unstable"
   },
   {
      "history" : [
         [
            "a3a07ac733f5aa4a1b1800d4a4042b65c6a9865f",
            "2025-02-18T00:52:19Z"
         ]
      ],
      "name" : "nixos-unstable-small"
   },
   {
      "history" : [
         [
            "f0204ef4baa3b6317dee1c84ddeffbd293638836",
            "2025-02-18T00:52:26Z"
         ]
      ],
      "name" : "nixpkgs-unstable"
   },
   {
      "history" : [
         [
            "c618e28f70257593de75a7044438efc1c1fc0791",
            "2025-02-18T00:52:17Z"
         ]
      ],
      "name" : "nixos-24.11"
   },
   {
      "history" : [
         [
            "c618e28f70257593de75a7044438efc1c1fc0791",
            "2025-02-18T00:52:18Z"
         ]
      ],
      "name" : "nixos-24.11-small"
   },
   {
      "history" : [
         [
            "c618e28f70257593de75a7044438efc1c1fc0791",
            "2025-02-18T00:52:25Z"
         ]
      ],
      "name" : "nixpkgs-24.11-darwin"
   },
   {
      "history" : [
         [
            "b134951a4c9f3c995fd7be05f3243f8ecd65d798",
            "2025-02-18T00:52:16Z"
         ]
      ],
      "name" : "nixos-24.05"
   },
   {
      "history" : [
         [
            "0da3c44a9460a26d2025ec3ed2ec60a895eb1114",
            "2025-02-18T00:52:17Z"
         ]
      ],
      "name" : "nixos-24.05-small"
   },
   {
      "history" : [
         [
            "1e7a8f391f1a490460760065fa0630b5520f9cf8",
            "2025-02-18T00:52:25Z"
         ]
      ],
      "name" : "nixpkgs-24.05-darwin"
   },
   {
      "history" : [
         [
            "205fd4226592cc83fd4c0885a3e4c9c400efabb5",
            "2025-02-18T00:52:15Z"
         ]
      ],
      "name" : "nixos-23.11"
   },
   {
      "history" : [
         [
            "205fd4226592cc83fd4c0885a3e4c9c400efabb5",
            "2025-02-18T00:52:16Z"
         ]
      ],
      "name" : "nixos-23.11-small"
   },
   {
      "history" : [
         [
            "7144d6241f02d171d25fba3edeaf15e0f2592105",
            "2025-02-18T00:52:24Z"
         ]
      ],
      "name" : "nixpkgs-23.11-darwin"
   },
   {
      "history" : [
         [
            "70bdadeb94ffc8806c0570eb5c2695ad29f0e421",
            "2025-02-18T00:52:14Z"
         ]
      ],
      "name" : "nixos-23.05"
   },
   {
      "history" : [
         [
            "a1982c92d8980a0114372973cbdfe0a307f1bdea",
            "2025-02-18T00:52:15Z"
         ]
      ],
      "name" : "nixos-23.05-small"
   },
   {
      "history" : [
         [
            "a1982c92d8980a0114372973cbdfe0a307f1bdea",
            "2025-02-18T00:52:24Z"
         ]
      ],
      "name" : "nixpkgs-23.05-darwin"
   },
   {
      "history" : [
         [
            "ea4c80b39be4c09702b0cb3b42eab59e2ba4f24b",
            "2025-02-18T00:52:13Z"
         ]
      ],
      "name" : "nixos-22.11"
   },
   {
      "history" : [
         [
            "ea4c80b39be4c09702b0cb3b42eab59e2ba4f24b",
            "2025-02-18T00:52:14Z"
         ]
      ],
      "name" : "nixos-22.11-small"
   },
   {
      "history" : [
         [
            "ea4c80b39be4c09702b0cb3b42eab59e2ba4f24b",
            "2025-02-18T00:52:23Z"
         ]
      ],
      "name" : "nixpkgs-22.11-darwin"
   },
   {
      "history" : [
         [
            "380be19fbd2d9079f677978361792cb25e8a3635",
            "2025-02-18T00:52:12Z"
         ]
      ],
      "name" : "nixos-22.05"
   },
   {
      "history" : [
         [
            "380be19fbd2d9079f677978361792cb25e8a3635",
            "2025-02-18T00:52:12Z"
         ]
      ],
      "name" : "nixos-22.05-aarch64"
   },
   {
      "history" : [
         [
            "380be19fbd2d9079f677978361792cb25e8a3635",
            "2025-02-18T00:52:13Z"
         ]
      ],
      "name" : "nixos-22.05-small"
   },
   {
      "history" : [
         [
            "380be19fbd2d9079f677978361792cb25e8a3635",
            "2025-02-18T00:52:23Z"
         ]
      ],
      "name" : "nixpkgs-22.05-darwin"
   }
];
for (const channel of graphData) {
  for (const commit of channel.history) {
    commit[1] = d3.isoParse(commit[1]);
  }
}
