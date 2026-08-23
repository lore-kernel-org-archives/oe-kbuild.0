Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDE838CFE8
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787489783; cv=fail; b=RVj+5KApe0OQY7qsMDNrSThKGofWhETVUYYjq1MxcqruGxKjCh3rsrZZAFu7CG9J65Bd0rQkTmFZpcepUuzYLAaHgY4dUB1QqB9HglA4le9VlGDvvNSf9vKVLmlKIzLRtgBYbmxaidM7NRg15rLlVbiBwW3CpktUlPX62ygt0H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787489783; c=relaxed/simple;
	bh=UhyWuup72YY6LyAnfRQbU5eiG7NfShBeoEVYf2q9TMg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=QUdjEXOaPahpluQJoI1CQn/oT0kWa+dwbY3O0jcUpzuzXHiKEvpHBGm6yS/abL5tejAjynLemGeBKZD33qiI14TiH/qTcEHWx+iZWT9RVKp8KmaKdja0y97bod2HzP9IiRxxkqwDa3npQa/hRFDcME8s5HzyVvjPRfVLIfrZ1ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCok+BPw; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCok+BPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787489781; x=1819025781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UhyWuup72YY6LyAnfRQbU5eiG7NfShBeoEVYf2q9TMg=;
  b=RCok+BPwNyMgjId4pLJmWVeQk3k7dkqaIvDoWOyWjoc9/njjSDFrI2Mi
   qAp9NjaMVSX87N4udzszo/uynFqSY27YU7wZ53HZMblmZ4HBTCKcHRjCe
   JTnMgoFAaHM3lnXc+EPh0RSMLOlE4bQshonRbm3TtY4BeWvJUy/bPti8m
   FllWAgT8P9zquuO2r1eqBfehSBe7RAbR6W+FbP6NV3K8s3mI1cgpBVEU1
   yEh/R4bKprk4D3YL7EygDBHEXfyjrosJxvE2Wq/2zk7JCRAKCGpwzwtst
   yeQjD06q3vzxzpz+XpgGxeNKe6hIcN4f050TNYadZe1wenYEM6jqV5NVf
   w==;
X-CSE-ConnectionGUID: ZpmA9ajlSA2RSocz2pY+Rw==
X-CSE-MsgGUID: 2uKJFWN1RJqD7SYOMfWo8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="105498699"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="105498699"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:56:21 -0700
X-CSE-ConnectionGUID: as5eZdGqQVug15c2V1kO6w==
X-CSE-MsgGUID: N7dA3hBxTmyO6DD1fo+OjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="265465702"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:56:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:56:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:56:20 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:56:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pr1e4h1qLnhxYgUaUaQd/JRWiYKkwy5ADDkGSn8nbvmHetCVCCVvaSSJ28abYJ8f1SPnycO5Fxi2R/TZyzMK1F3sUxcNopbuXUMJnYG1KIdgeu3V1UiIvSpJKhVjz72o024KHeGVar3+uzJBjfGVkH+DB5NQhjiV+wm/ePiseJ3f7tHITbnH1a1UfOfW1oZZO3lDIJ9xPkhLe1+c8eecAGpMFuom5n2z+rSNZuRpr0OVm+gCYf2lZi+5XGnHA0B+JT1kfx/qsPcqK574bhdrXehYyUYadILK9yhxWvWAkpp2cbl3bK/S/sZXB34CwtwClVOKx4HNaBdN4KxXTOa+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Is6mr+kd6BLQ2CstPAchfBvb/Anv4XSCKkF/mvRdCC4=;
 b=lEmN4z1VNUdsmEylgLnm5iTGx/FETjVOPMzBov5Xn6NHjzakwH4Wkez6/SflIZ6+IzB/YLVJ6vGipQivYnXsOuRstMWXBWMMiMA+nMCfJ5BWXImZ9RkA5y5J4QxfttuU22FRJV6Zj5hcYYxbbSHy5xoCjY7EyR2GF8AGDUYeSvDyAQANugRqJx0J08k9J1PyMgOCkSyEOXa5yYtLC+rqxliXrEOTbeWr9hnuswOARx9H/xwjDwgXZfLZ0Wwu4tMjUI8r/bXALfbOWhDphABslsNhVaSuZXkzBeN6lNFXGCTwRxFZ3mq5Tv8uyNRn+ulBRPcG/TIszQkmDQlmBfovUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:56:18 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:56:17 +0000
Date: Sun, 23 Aug 2026 20:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Add RPi Touch Display
 2 7-inch
Message-ID: <202608220752.IUT6F0vH-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|SJ0PR11MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ddcfe6f-9964-4bdb-725e-08df0115ec14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|10067099003|3023799007|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: m3MEjiW4EQHst8cAM+h+T+auWgTdZMhRkBNdLYOtntnleREQ861t6WcYjQ+lrZsf3h9gdZI53P2N7j/ypYMQPC05xRe4TM0RpRRgTckOzQZ0tWn8vWmNL3XDA2UU7x3xmxGhIZbf3EHFZzD0Bjo1lmAA84IG35iiVR2RkNn6CiKl6kR1iuTR3vnZHcAWFFwWJsIeEpDWutKi51x5rI9CYvrp1ql4z16nB2c6+PPrJyAQPjSFiTTHaPncIvwFq8+HE5FU+oRtBnAMLyVN5Rrmib4S3xqvmKjyPMOzvyhNAXvD8YGv4KIF0f7XlvsYEj8A4bzJpeITNoKrD3CYx7Y1d7wl3RsjO8gR8NBA/WEI5aPhq7M0KEqWLwmqZlqgMS5uYisbjZr6GPrDh8kLn//685E3Ph5iAGT+NBoAXjhDC0/p/CV0ab+cSmCo8b0kV3FK00w/+xnHeY3LMHS6GetGn2OpxcazRWpomY7DTC/y09znK8PrmSdQlYoTKbAwap+tDn85egGmHLV8ed8cdaKRYIexai03KbQhsfY0L2TGVvc0wBvHx+uLk10ZQZIMbCabXo/cDZ0iaVURAPoSUbxs22k6sYVLU2c+zdnXvHx/UBuOQXEEzhBKeDyK5g59WKby
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(3023799007)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qjsvEIFUZSnb+eyA7rzXUnOezQ042WUlOjiaoQ/CKuQaUrce/+SmHCzQhK/1?=
 =?us-ascii?Q?aZDN7TQbGvSI9J2EYoU2MHgyvFHm2k6xOICvXkNbS650gAAlK/38WvklkOr5?=
 =?us-ascii?Q?7cCFQdpWhvurW99Jc571XXHuW7bkg9G95Dg/MXt8sX4huT14HnKkunkHNt0A?=
 =?us-ascii?Q?RBuOE7/TxLII+q7TQPXnFnzNw5ynG9zvpTCAIg566sHFj+MfaSPuXQA1YH3/?=
 =?us-ascii?Q?lvtpLAkKU8+SerGJkBlxcO4m3JhTJtEHngw3mIytuE+fp8tRgbiCKKlB2UhW?=
 =?us-ascii?Q?yenT44gur+zMjZQDjLZh85UNHvElxMOAIFPkNyXOrdZ5ArBinMT6Bu5wxnQK?=
 =?us-ascii?Q?3O3JsULA0ejBw3FcQuUZBAK+0XIddlh8dRw3cGVKrwzdEAfLw6lE//6Gewdj?=
 =?us-ascii?Q?1u5dwvbIRQtswA0whn9GLatckK/29MW3Jlsqlvta7caF+J+1TWuFMiEee8nU?=
 =?us-ascii?Q?HyCswzEhc0zArLpCkHoc7ETIzSNZRMRkUUGVju2kD3fZWISc+eeg0MzIV9eC?=
 =?us-ascii?Q?qr6BumY5flSXFV2zaQMlyCjhSKN2VDMoL5frJP1sRydEG5oE0fyixkg37jSY?=
 =?us-ascii?Q?mgJk0RtLkLF4gSU7on6ULk/9CI90UnZGGoITIwb9H/VIoZlfdZbR7I3iCBsz?=
 =?us-ascii?Q?zI3wTqc9J5RILGC2g1OU1JAJownheYhI9d4a+sT1Pf8YXPMa+qkG6P8TII3u?=
 =?us-ascii?Q?5bAn87PnGtOrF97Ti3QhBmaOeKhnH4S5f26GCNDqI0PuMcUQnbBPsO3PB4Ny?=
 =?us-ascii?Q?SQQj342zuZTGH3TVh6jfNZn1kFq3d53oVtVnGO1lP87pNHb/VRnLjRPalD3g?=
 =?us-ascii?Q?1EtgWwn9Ujth1FaP+CF2d2p2YNWsd2LRe0dCU1NdxD24Q9vYFJAyxEG4LOkp?=
 =?us-ascii?Q?BX/pbYmEL6RHqcC8Q8W3XTI8bJ76gy7gAQmioxe1olR1GEqnLF9QvObZZDqZ?=
 =?us-ascii?Q?zUfvCDmkMjUio0QHkBUC7HXXbU63AEE+//gjmQ+n5kwdSLfzzvLlk68fNy4u?=
 =?us-ascii?Q?t1sy30nlFsIS2qk/N4lPhfhExchT2NPQHOdhcHaO0xAMOXkhHwINUhhU9XLJ?=
 =?us-ascii?Q?d6wIENZL2x63xVU8kcHBu2IdXN1/h6asL/rK5k8WpJsAd1muSQKIhr60z73w?=
 =?us-ascii?Q?DTkgmhptu8PFgzGLXZX6Jqdmzf09p2k6x5CcdiDlih7o6p+nK5HnH2lcnFaC?=
 =?us-ascii?Q?gVIxbxXVGhndXSdATbyayLpq57uGzexMLtyN9QhVCUr161ozT9jRC8xYVwX5?=
 =?us-ascii?Q?HDuOGF2LgZOtMqpleILHr8tS6GHBDB65G5udxr/bsnw3hURniPmtR+DhYNVs?=
 =?us-ascii?Q?fIlGphed4mW/mC4qCxXBoRT0vSPgATMi7q2icvpqs7H6AcSWtrHQs4dutGl8?=
 =?us-ascii?Q?SZRTKllurrWVjwgMIig9qFE5MsorobU3hTu5ZoTH6zL+IBJUhDDvnSfY15Of?=
 =?us-ascii?Q?0p/1soCn6tExGmvhrIjgU8m7sslAzM4jXzK7FoI/GdqAIo0qhzhGkeUvT6HT?=
 =?us-ascii?Q?Q+l/YfgGqblDD95AmBi3ozOV/nm3a8V9fpsE9pLv3gqtU3fWv+ByDq1qrKbA?=
 =?us-ascii?Q?opxtvLuHWkCmVj23B6pl64Q+8LANVbmEp1o7Ibp2Z7GgFeapfGY0MnQLLzwl?=
 =?us-ascii?Q?TujO7olkT2ItKDadIrX69mQob5KBhzDv2mw1VDn8lPwoj/GIWkRclD8CHJkA?=
 =?us-ascii?Q?ma+Q+p+DROre0RsMc487WexPN+hr1W/R2CL8yDya2YjuG1UK+2V9ukeBIfNG?=
 =?us-ascii?Q?G70XqJtp9Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: 4MbG224RenPLyXb4ZnBdN1qU1ZUcEv8re5wA/8lI3eg92AzsyR/htKPyOT69Wy2tMKGOGEklo18FoFeZu2fdIzKM9U+erqSdiaIuEHul4vrH73K2c+6aaAy545GMvypXPP93sn25yyixAzJFz0n0VmP9i9y8cE/D/9Yy2ezLUw9tnWv+bPoHdokEScQere/Mw17bvwRwckbkFj/H3gfNLsd9jdsA93I/DxteJfUZQsZYILqgHZCn2P4F7qS7hYMtK/wkTeRfMbV+PkJqmbPE0NzAXsMTloE2nYf+QLzi/qaHdOxYMIxoD9h9FK1++WP62Cb0CTEVE7FwmwtFu+UDqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddcfe6f-9964-4bdb-725e-08df0115ec14
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:56:17.9514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4/LSS87UtgqdyYU/0Ye8Wff6DKJ4OzW413WLWib9JCb95N+sxbozHHx+Mgx46I1hI4cs/wIeoT5HLgUfedWvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770
X-OriginatorOrg: intel.com

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260623114329.63142-1-francesco@dolcini.it>
References: <20260623114329.63142-1-francesco@dolcini.it>
TO: Francesco Dolcini <francesco@dolcini.it>
TO: Nishanth Menon <nm@ti.com>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Tero Kristo <kristo@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Francesco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on v7.2]
[cannot apply to linus/master next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Dolcini/arm64-dts-ti-k3-am62-verdin-Add-RPi-Touch-Display-2-7-inch/20260813-153909
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260623114329.63142-1-francesco%40dolcini.it
patch subject: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Add RPi Touch Display 2 7-inch
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2054-20260820 (https://download.01.org/0day-ci/archive/20260822/202608220752.IUT6F0vH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220752.IUT6F0vH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608220752.IUT6F0vH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev-rpi-display-2-7in.dtb: dsi@e (toshiba,tc358778): ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/toshiba,tc358768.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
