Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896178;
	b=bL7HrhX3uSbX0s0ktVBMPDSpdFCTzDkH25KUXne2InZ5MiO8fhMK60QXI9i2LR9psE7Q
	 wKgrc6xo4Oenr6Rn53MFPFHRCGFMwMXBNqCpEMPyfxtwwfW5QfqE4hQ4NMrVLZ271npIs
	 KijuwX9vUxy5msC94+oJ9oIbF9VIc0kB6FYBA+M4Xm9Rbs680w6wM511CpZ11MaPx92Rq
	 zWhKw9Uj9+Fd6KE/rUMNMcsZLpPbGAoiQe6JgXYdrCqvEAF1TV9uyidYoChrfMMmHcNxG
	 Cpj1TXgIheKlNaqpsDmehUqKgv9uoK00gADeSyuchoC1Gz34HuoplcJ1Vc66gguh5Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9kVfpwXb65QiTfT13PlR4HGC4zqBt8rkl7VyBnRef0s=;
	b=n91FHn95ZFlq0mgEeKqKG7iAKyk9zHJw+l/kP/oz8aUMO/AcDCr/4LmClr36F3i/Ks6d
	 CQM16mF+9ngZzVDK20oidNKUvtqdn2owCW62qdvulHWl3ZlZ3SIlg6aaYE0FyH5j6KwOv
	 7C14k2/0SBEnC+OwnHd1SWDv0X3qz6YwjVhh07EFGSHIZCHluOi5xLMB4KuNPU4/lFDJZ
	 CxLoZtNLwEj/jDkP+fM0wGOC7V2J3wNS2H7QXeZ9w2ncgxjraObLwxeTp1Cfo8NM8Cqhc
	 QoBqQO6c3oSyd3yCOpdDeQWhA1q55p34go6B+JI104CqU/NHo4xiLywVg6IYFSomFAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j9XTdjFP;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1626F606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 06:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1626F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j9XTdjFP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794896178; x=1826432178;
  h=date:from:to:cc:subject:message-id;
  bh=k4RhCg8zCNM/tO0RI9Yy6Br1DQVBekM3EZn6RUEYZmU=;
  b=j9XTdjFPnjYARpkKuQEHlkh5/ssD2yiXOnh6/Yq9c7TS1J/6VTStRaz4
   ddSuN9h+VLj9JLoYdbkDfL0FfBMnOLSEfLrBUZf+VMhRl4KlhwV2BsmZd
   FkGQ+fchtFnzTZmqkgZvKhDbUGNGT9X0w29MGjHWvV5KTyTEfibnroWZe
   JJvwzz4xDV1s+Nx8VT75D9K+Yssulh7KJmZTFi/cxhD8FDzKlTf0SGzFb
   X9cx5/3XQPi8y2nubF6PQym/UVn5oW4tIHR7tyCSCotGo0n114jHTe6pj
   9+zaADSRCdUZt5JEtuLk1YSQnkL2W6CXTQh4DqHOsRKCusvkcN+LUtocy
   A==;
X-CSE-ConnectionGUID: /w25aDPuS+WWbB45sVZ8Bg==
X-CSE-MsgGUID: pcnWGsW3Q3WIyX2HaLTnAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3730323"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3730323"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 22:16:18 -0800
X-CSE-ConnectionGUID: rFdivNdlRJqOslDDg3B5dA==
X-CSE-MsgGUID: RZ78XlNASl6S0Tzz0gmk7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11539412"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 16 Nov 2026 22:16:16 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTCUH-00000001A99-3yux;
	Tue, 17 Nov 2026 06:16:13 +0000
Date: Tue, 17 Nov 2026 14:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:asoc-7.5 6/6] sound/soc/amd/acp-config.c:164:2:
 error: expected '}'
Message-ID: <202611171416.SbpDnoUs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.5
head:   d986a3c94d54cbbe6373ec963321b85662585c4e
commit: d986a3c94d54cbbe6373ec963321b85662585c4e [6/6] ASoC: Merge up fixes
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm64-randconfig-1000-20261117 (https://download.01.org/0day-ci/archive/20261117/202611171416.SbpDnoUs-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a69be15ed58ed48738a69ec4c7d0f3e8c7dbe4ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611171416.SbpDnoUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611171416.SbpDnoUs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/amd/acp-config.c:164:2: error: expected '}'
     164 | };
         |  ^
   sound/soc/amd/acp-config.c:26:70: note: to match this '{'
      26 | static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
         |                                                                      ^
   1 error generated.


vim +164 sound/soc/amd/acp-config.c

f1bdd8d385a8035 Ajit Kumar Pandey 2021-11-17   25  
d0426510a9e1fab Hasun Park        2026-03-09   26  static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
d0426510a9e1fab Hasun Park        2026-03-09   27  	{
d0426510a9e1fab Hasun Park        2026-03-09   28  		.matches = {
d0426510a9e1fab Hasun Park        2026-03-09   29  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
d0426510a9e1fab Hasun Park        2026-03-09   30  			DMI_MATCH(DMI_PRODUCT_NAME, "HN7306EA"),
d0426510a9e1fab Hasun Park        2026-03-09   31  		},
d0426510a9e1fab Hasun Park        2026-03-09   32  	},
7587fc10cba6c4a Simon Trimmer     2026-10-07   33  	{
7587fc10cba6c4a Simon Trimmer     2026-10-07   34  		/* ASUS EXPERTBOOK AM7406CKA (Kraken Point, ACP 7.0) */
7587fc10cba6c4a Simon Trimmer     2026-10-07   35  		.matches = {
7587fc10cba6c4a Simon Trimmer     2026-10-07   36  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
7587fc10cba6c4a Simon Trimmer     2026-10-07   37  			DMI_MATCH(DMI_PRODUCT_NAME, "ASUS EXPERTBOOK AM7406CKA"),
7587fc10cba6c4a Simon Trimmer     2026-10-07   38  		},
7587fc10cba6c4a Simon Trimmer     2026-10-07   39  	},
6e4bfd9da8851f5 Jasper Smet       2026-05-13   40  	{
6e4bfd9da8851f5 Jasper Smet       2026-05-13   41  		/* ASUS Zenbook S16 UM5606GA (Strix Point, ACP 7.0) */
6e4bfd9da8851f5 Jasper Smet       2026-05-13   42  		.matches = {
6e4bfd9da8851f5 Jasper Smet       2026-05-13   43  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
6e4bfd9da8851f5 Jasper Smet       2026-05-13   44  			DMI_MATCH(DMI_PRODUCT_NAME, "Zenbook S16 UM5606GA"),
6e4bfd9da8851f5 Jasper Smet       2026-05-13   45  		},
6e4bfd9da8851f5 Jasper Smet       2026-05-13   46  	},
fc12cf16df9af86 Jackie Dong       2026-05-27   47  	{
fc12cf16df9af86 Jackie Dong       2026-05-27   48  		/* Lenovo Yoga Pro 7 15ASH11 (Strix Halo, ACP 7.0) */
fc12cf16df9af86 Jackie Dong       2026-05-27   49  		.matches = {
fc12cf16df9af86 Jackie Dong       2026-05-27   50  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fc12cf16df9af86 Jackie Dong       2026-05-27   51  			DMI_MATCH(DMI_PRODUCT_NAME, "83W5"),
fc12cf16df9af86 Jackie Dong       2026-05-27   52  		},
fc12cf16df9af86 Jackie Dong       2026-05-27   53  	},
9ad4c2331d2330a Jackie Dong       2026-07-27   54  	{
9ad4c2331d2330a Jackie Dong       2026-07-27   55  		/* Lenovo Legion 7 15ASH11 (Strix Halo, ACP 7.0) */
9ad4c2331d2330a Jackie Dong       2026-07-27   56  		.matches = {
9ad4c2331d2330a Jackie Dong       2026-07-27   57  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
9ad4c2331d2330a Jackie Dong       2026-07-27   58  			DMI_MATCH(DMI_PRODUCT_NAME, "83V9"),
9ad4c2331d2330a Jackie Dong       2026-07-27   59  		},
9ad4c2331d2330a Jackie Dong       2026-07-27   60  	},
5d35f9be9b54a1b Zhang Heng        2026-09-22   61  	{
5d35f9be9b54a1b Zhang Heng        2026-09-22   62  		/* Lenovo Yoga Pro 7 14ASP9 (Strix Point, ACP 7.0) */
5d35f9be9b54a1b Zhang Heng        2026-09-22   63  		.matches = {
5d35f9be9b54a1b Zhang Heng        2026-09-22   64  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
5d35f9be9b54a1b Zhang Heng        2026-09-22   65  			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
5d35f9be9b54a1b Zhang Heng        2026-09-22   66  		},
5d35f9be9b54a1b Zhang Heng        2026-09-22   67  	},
8f356232d0d563b Zhang Heng        2026-11-09   68  	{
8f356232d0d563b Zhang Heng        2026-11-09   69  		/* Lenovo Legion 5 15AGP11 (ACP 7.0) */
8f356232d0d563b Zhang Heng        2026-11-09   70  		.matches = {
8f356232d0d563b Zhang Heng        2026-11-09   71  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
8f356232d0d563b Zhang Heng        2026-11-09   72  			DMI_MATCH(DMI_PRODUCT_NAME, "83Q6"),
8f356232d0d563b Zhang Heng        2026-11-09   73  		},
8f356232d0d563b Zhang Heng        2026-11-09   74  	},
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   75  	{
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   76  		.matches = {
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   77  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
15596a87fcc6fa0 Shengyu Qu        2026-08-27   78  			DMI_MATCH(DMI_PRODUCT_NAME, "FA401EA"),
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   79  		},
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   80  	},
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   81  	{
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   82  		.matches = {
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   83  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   84  			DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook 18 M1807GA"),
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   85  		},
27d090f3ccd4cad Syed Saba Kareem  2026-07-10   86  	},
de0be324fcb97a4 Zhang Heng        2026-09-28   87  	{
de0be324fcb97a4 Zhang Heng        2026-09-28   88  		/* ASUS Zenbook S14 UM5406GA (Strix Point, ACP 7.0) */
de0be324fcb97a4 Zhang Heng        2026-09-28   89  		.matches = {
de0be324fcb97a4 Zhang Heng        2026-09-28   90  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
de0be324fcb97a4 Zhang Heng        2026-09-28   91  			DMI_MATCH(DMI_PRODUCT_NAME, "Zenbook S14 UM5406GA"),
de0be324fcb97a4 Zhang Heng        2026-09-28   92  		},
de0be324fcb97a4 Zhang Heng        2026-09-28   93  	},
8393e0bf593be4f Ville Saarinen    2026-08-09   94  	{
8393e0bf593be4f Ville Saarinen    2026-08-09   95  		/* HP OmniBook X Flip 14-kc0xxx (Strix Point, ACP 7.2) */
8393e0bf593be4f Ville Saarinen    2026-08-09   96  		.matches = {
8393e0bf593be4f Ville Saarinen    2026-08-09   97  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
8393e0bf593be4f Ville Saarinen    2026-08-09   98  			DMI_MATCH(DMI_BOARD_NAME, "8EA1"),
8393e0bf593be4f Ville Saarinen    2026-08-09   99  		},
8393e0bf593be4f Ville Saarinen    2026-08-09  100  	},
4d6642d64cd00f2 Sehat Mahde       2026-08-25  101  	{
4d6642d64cd00f2 Sehat Mahde       2026-08-25  102  		/* HP OmniBook X Flip 16-cc0xxx */
4d6642d64cd00f2 Sehat Mahde       2026-08-25  103  		.matches = {
4d6642d64cd00f2 Sehat Mahde       2026-08-25  104  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
4d6642d64cd00f2 Sehat Mahde       2026-08-25  105  			DMI_MATCH(DMI_BOARD_NAME, "8EA2"),
4d6642d64cd00f2 Sehat Mahde       2026-08-25  106  		},
4d6642d64cd00f2 Sehat Mahde       2026-08-25  107  	},
a08578200344eb4 Baojun Xu         2026-11-03  108  	{
a08578200344eb4 Baojun Xu         2026-11-03  109  		/* HP Cashmere-A */
a08578200344eb4 Baojun Xu         2026-11-03  110  		.matches = {
a08578200344eb4 Baojun Xu         2026-11-03  111  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
a08578200344eb4 Baojun Xu         2026-11-03  112  			DMI_MATCH(DMI_BOARD_NAME, "8EF5"),
a08578200344eb4 Baojun Xu         2026-11-03  113  		},
a08578200344eb4 Baojun Xu         2026-11-03  114  	},
a08578200344eb4 Baojun Xu         2026-11-03  115  	{
a08578200344eb4 Baojun Xu         2026-11-03  116  		/* HP Sundae */
a08578200344eb4 Baojun Xu         2026-11-03  117  		.matches = {
a08578200344eb4 Baojun Xu         2026-11-03  118  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
a08578200344eb4 Baojun Xu         2026-11-03  119  			DMI_MATCH(DMI_BOARD_NAME, "8F6D"),
a08578200344eb4 Baojun Xu         2026-11-03  120  		},
a08578200344eb4 Baojun Xu         2026-11-03  121  	},
a08578200344eb4 Baojun Xu         2026-11-03  122  	{
a08578200344eb4 Baojun Xu         2026-11-03  123  		/* HP SundaeWhip UMA */
a08578200344eb4 Baojun Xu         2026-11-03  124  		.matches = {
a08578200344eb4 Baojun Xu         2026-11-03  125  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
a08578200344eb4 Baojun Xu         2026-11-03  126  			DMI_MATCH(DMI_BOARD_NAME, "8FA4"),
a08578200344eb4 Baojun Xu         2026-11-03  127  		},
a08578200344eb4 Baojun Xu         2026-11-03  128  	},
a08578200344eb4 Baojun Xu         2026-11-03  129  	{
a08578200344eb4 Baojun Xu         2026-11-03  130  		/* HP SundaeWhip DSC */
a08578200344eb4 Baojun Xu         2026-11-03  131  		.matches = {
a08578200344eb4 Baojun Xu         2026-11-03  132  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
a08578200344eb4 Baojun Xu         2026-11-03  133  			DMI_MATCH(DMI_BOARD_NAME, "8FA5"),
a08578200344eb4 Baojun Xu         2026-11-03  134  		},
a08578200344eb4 Baojun Xu         2026-11-03  135  	},
a08578200344eb4 Baojun Xu         2026-11-03  136  	{
a08578200344eb4 Baojun Xu         2026-11-03  137  		/* HP Kata-A */
a08578200344eb4 Baojun Xu         2026-11-03  138  		.matches = {
a08578200344eb4 Baojun Xu         2026-11-03  139  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
a08578200344eb4 Baojun Xu         2026-11-03  140  			DMI_MATCH(DMI_BOARD_NAME, "9056"),
a08578200344eb4 Baojun Xu         2026-11-03  141  		},
a08578200344eb4 Baojun Xu         2026-11-03  142  	},
38cb2ef26b64112 Art O Cathain     2026-10-16  143  	{
38cb2ef26b64112 Art O Cathain     2026-10-16  144  		/* Dell 14S DS14265 */
38cb2ef26b64112 Art O Cathain     2026-10-16  145  		.matches = {
38cb2ef26b64112 Art O Cathain     2026-10-16  146  			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
38cb2ef26b64112 Art O Cathain     2026-10-16  147  			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14S DS14265"),
38cb2ef26b64112 Art O Cathain     2026-10-16  148  		},
38cb2ef26b64112 Art O Cathain     2026-10-16  149  	},
817b86669dcedaf Matthew Schwartz  2026-11-04  150  	{
817b86669dcedaf Matthew Schwartz  2026-11-04  151  		/* ASUS ROG Xbox Ally X20 (Strix Point, ACP 7.0) */
817b86669dcedaf Matthew Schwartz  2026-11-04  152  		.matches = {
817b86669dcedaf Matthew Schwartz  2026-11-04  153  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
817b86669dcedaf Matthew Schwartz  2026-11-04  154  			DMI_MATCH(DMI_BOARD_NAME, "RC74XA"),
817b86669dcedaf Matthew Schwartz  2026-11-04  155  	},
067db578cc2d16d Jaehoon Kim       2026-11-11  156  	{
067db578cc2d16d Jaehoon Kim       2026-11-11  157  		/* LG gram 16 16Z95U (ACP 7.2) */
067db578cc2d16d Jaehoon Kim       2026-11-11  158  		.matches = {
067db578cc2d16d Jaehoon Kim       2026-11-11  159  			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
067db578cc2d16d Jaehoon Kim       2026-11-11  160  			DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
067db578cc2d16d Jaehoon Kim       2026-11-11  161  		},
817b86669dcedaf Matthew Schwartz  2026-11-04  162  	},
d0426510a9e1fab Hasun Park        2026-03-09  163  	{}
d0426510a9e1fab Hasun Park        2026-03-09 @164  };
d0426510a9e1fab Hasun Park        2026-03-09  165  

:::::: The code at line 164 was first introduced by commit
:::::: d0426510a9e1fabf074e274ceff26ffc6500980a ASoC: amd: acp: add DMI override for ACP70 flag

:::::: TO: Hasun Park <hasunpark@gmail.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
