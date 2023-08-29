Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067A963A
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Aug 2023 02:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693276587; x=1724812587;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6VeX2FnlY5ostJ/6AG9xeOu3Y4pWkUtPnN6tM7dZSig=;
  b=KFGpZ9Rd7QNq0acMFqnOUSZB02dutYt6DXJs8vwZoYnmESeNu6VcknLH
   mwIcEiP6vrWRXBm47cN5Z0E+XiWlvpvwIo5DfaWKrBGpjvWIF1+kvwF6W
   I6y+jMHgke2stmCEuK8dHw97uknYJHWCRnvi1WX9Y24WP0syopnGrONtC
   7F/lSe6erPZpFKFugixJGth9894gMpBMd739RTfeg4Da0vuSzBKEhkL7f
   D/PVhOaxsPpjsC1okHPOYTZHNMCwOcTnoQnRQC3WwVjdVdsxkAq37D7u+
   zYOxuVveBGBchJibCKjbhEDQ/VrJmX/HhkRxoOKf6ydeWivELgKMuwynh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="372674947"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="372674947"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 19:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="882140963"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2023 19:36:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 19:36:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 19:36:24 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 19:36:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFuNh044L+6hNzoJ/9Sr6RSBw0bWsigDGJ51kKB94waWIuMTPbFidjmoaLp+B7HquFPH9heoQmKTNrh8qfXEPQj0H9tr0PuGr83aQ0Lp1x/9aQfjUnaNt3PJ9t3DKB4/RZNkeS+KwEaLYY1LeyPFpee7ejg+9MLPw8gXXBTIFtT9j+JZkJbtnNZu9wqceAEVQzY2it3aac3/m2uChcCdVpMiUS31HefvoeJcYz/ecZBG9H9dU9qbUIkndDV9e1XlQEJULRGVBjGfV2VmE+DcusLr3f5VJMliNclBmpkSePjICpRxaZBWPnCTmZoEfGSVjKAecEX///MCRgAtcXRsww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEVDHoV2U6sxO0DrQm6tXb1N1s5sbCSxLgqQvHgYe9c=;
 b=fJjBkZfEJcyvHUNZgKpH0w+En9DgcVdkVdFHaku7oUYbysYhiyl82VeJt4fhS7dnS+s9untb8VzV2hX/WSqnUaVMjJcxRv+sIqltoIX3+ELLRrVAJIjXnrKq4CiluYt61J0NmhGhZdHQbMSesFNW4m11JoXKN1cLruzeOLSjJex4RPpDZozn4RlVcdPjbw/w+oKGf+RdA0GFqa9fA6wRzH3GLj2Qcq4wDbqHlvh9FgbBLvdvcuWu/Fuo6JJlkpf5OzeVrOMaHP/JecL3ikssm2OB6XbSSHxflV9f5sdEGZahH2IsnX2kseNBmv5OQOtJCaxoihlWJt2ZQozx6Jg3Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 DS7PR11MB6061.namprd11.prod.outlook.com (2603:10b6:8:74::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Tue, 29 Aug 2023 02:36:21 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::ed83:aa52:335e:776c]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::ed83:aa52:335e:776c%5]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 02:36:21 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH v2 6/6] regulator: pca9450: register restart handlers
Thread-Topic: [PATCH v2 6/6] regulator: pca9450: register restart handlers
Thread-Index: AQHZy1OcyWxxwtoxOUuQ+6Eh66qgj7AAqoCQ
Date: Tue, 29 Aug 2023 02:36:21 +0000
Message-ID: <DS0PR11MB639779CA73EEBC6E3ECA1E26FBE7A@DS0PR11MB6397.namprd11.prod.outlook.com>
References: <202308101403.rZTxk0pZ-lkp@intel.com>
In-Reply-To: <202308101403.rZTxk0pZ-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6397:EE_|DS7PR11MB6061:EE_
x-ms-office365-filtering-correlation-id: 41a14b21-5f41-4a80-4d38-08dba838baf7
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lk4FPj8o3Q7W3c3+1qKBce7C2FnQNI7btir3q7GirlQ4omZhuwnbDeb8fBfmCrVt7Kg36wMO2dCv+rOaK5lN8LUBGgBzutd7+dA0bOnUIdiCqFqoyW/RtNqsHrmPVKA9oIBH29m3LLVB+LuShAMYyR1GYp9c0yMGVO0pzwuq5I2XfgaYoB2C862mrxoNnELlqkKDHrrq9In2Nn7OYfFuob8Zz8jSeHEksRcPDHK/S9Jv0VahV6GY2harzZ0USBsTjHg8n3B1SM6OuT71mSvxgCY3TuphxEz6ig/JJ+dzfLto96+NO3gOY7lGG77ygZrfTOMPFCXowLMWlx+0/4ij4PQT/9sQ3yTamsHCOPx2PFfKusfWA8ExqdXWlFfKi4KJNZMSXClUdA9xRYiUZwWF3UFboXoOI6havwqskH28ICdNYsu58AhI2EF2GjEwqWfHU5cN/v/PS89M7TsJExI3nQNA9DcMxfBcJCKXW4eI9TF0z7cOXgFOEvMAQUukelvmmupL8edgyI1UsYNSZ4l9di2pj58g7DZBsdEuLhnZAVK6F0rMReyMBYmM5wBtDZr/6LFkm3DLsdtwniEQkgZ8oV6HCzHHkj5tQGd5RWDzfybAV++ZXwdAqbeQ5aI2wyyKRws1/wh6TEaBZ1MjZA9aLQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(186009)(1800799009)(451199024)(83380400001)(478600001)(966005)(122000001)(26005)(9686003)(110136005)(53546011)(6506007)(71200400001)(55016003)(7696005)(86362001)(82960400001)(316002)(33656002)(2906002)(52536014)(76116006)(38100700002)(8676002)(8936002)(66556008)(66476007)(64756008)(5660300002)(41300700001)(66946007)(66446008)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N8UBy0xFWOE+gZe1AVrPAKxXFO73dmgyzRnvIPB7q61D/646NMrRBZqzgBR6?=
 =?us-ascii?Q?8pAf/4HGZAywX0e9srJUkv+1q8fQS2oWBWlra1a2daG/enhP2PkOIK+9h18S?=
 =?us-ascii?Q?DL/TDrqKRY3OGtwA9RaWTVdvCW+QN3RR1XfCmG7QAR4HXyImL/Iw4gdeqzCZ?=
 =?us-ascii?Q?BL4FlWb//RKhMZTgeUJIUNZzZdI1IA7Ppex6tNmKrtnqRCzVT332SlJxPXCu?=
 =?us-ascii?Q?j2zWbapxgki7ATDSlvM2C2RzYrmPAvZUcBfRs4N6VlJ4v6GrzCc5fm5J3xVh?=
 =?us-ascii?Q?+2MKfQMo1rtysnzU/Q06j9rOUhs8b13wM75OHtweXMc6E1r1Lk9aJ0rPWADp?=
 =?us-ascii?Q?45Y0OUfDNFGTE+ujVhCGkKC4ZSx2MM7RNc5SaATf70de8nbRPW5cWV2BEv5J?=
 =?us-ascii?Q?mjvsjhke2W2neSjEjt5+B0tI2sKCV906J1vHfJ53vFyaJWa+ps651ObuHtpt?=
 =?us-ascii?Q?WKL8PWaDe329jmjuoN8rJAFHWOqt4rJRsWv8O5910K64PvnOAoFsVpZ0V/bC?=
 =?us-ascii?Q?Iq9vdbrj0AtVm02tYIpfjJFt70x3Pms9dh976LW244t03P+BzMGsprBipptY?=
 =?us-ascii?Q?RrBMWuiBlB5EBmo5fjWVuBISjMhVul0yw5qImt8QE1loWvLh8MW/ZVXTMqr5?=
 =?us-ascii?Q?tS/+m1AD2hJ2g21hGkFIbRMd1/hwQ4tuVFxYUuqe0iYSB5DTvwE8jBvbcE36?=
 =?us-ascii?Q?VzIOnIk3McMH8Los64vWBKwiS8frkndVYiQq8PRSomfAOhv2auM2yYzKRsWc?=
 =?us-ascii?Q?6SyqHKrz0LPuHkXd/xu6sF7XXPqJ2LcOx2DCKoUhXvYqeLGTISMLBzJeakwa?=
 =?us-ascii?Q?vOhmONpjl6i++oUxTx0x6hNJeS4IiTGEgWAOirrV95pw1E994ml5i1nEwHVV?=
 =?us-ascii?Q?sk7xvhWsMxye9lA3YcQRTTaRTNP7msehDpRRti2Fr9aevcQx8qWB3HeVlnkx?=
 =?us-ascii?Q?RsS7NxqqEAhNd7KlGSCdqiFhnlArAZITEgENZ4zK8o6GTe/Oj0VyhWuQ+M5V?=
 =?us-ascii?Q?IEVnRA2NrOo9o2VZV99k1dWXo6GAz53zZph5z4+tma3hb0eGwxtWR34wdiZB?=
 =?us-ascii?Q?dQAtj2Sz+uC9NTUJWZdfxGuCkLhaYqYjDaSl+uDoIP1mdwQ/TsaRxz4awDTl?=
 =?us-ascii?Q?1YQskg/9BANdN16VTw2xkkijgfMz6kdJsOboq9TDN5kf5Y/sxNcJ+0NB9X8W?=
 =?us-ascii?Q?/aJ/pOObRT2E7UyAe0xA5kbYHo+B6ieuKaIdYWq3TS8od7Q7UUrDSNxIKxsy?=
 =?us-ascii?Q?OuU6z/f6dJXkRoPgg4CcvKFtqLQYNiT61D/+2QjTk1b742E1FNv/Y5n59Ks7?=
 =?us-ascii?Q?em5RftLhtcYOxnXiYjI5P85TO3L13s/OEVUu8EyD3LsX6n2Wjl0iYju8ysrx?=
 =?us-ascii?Q?rTAW1mSkqXslAn/CiDYy9qke5SBH+r6rv0IwiOr+OjFYUIRu9B3F5gqcm80r?=
 =?us-ascii?Q?6/O3gkQOb8Zett0gqswtTL0E1NbFpGjiVDDXJ6DeGja9fk2xbXqdugoXU+0A?=
 =?us-ascii?Q?XboqkSaEhEdv9tOTTHPVFd3v14zM/brU60ce8B/mohBXUQ+F6PWmR/aYU2Jg?=
 =?us-ascii?Q?Co7sqJdiCHTPQjNS+K9eUBvN7CCxVqy0+NRst98W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a14b21-5f41-4a80-4d38-08dba838baf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 02:36:21.1300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uH9BbZBpe5OSAJr0RKuEtrU6erk6o0MQhPQFo7u+nGTA8+pQtKFrsfC5lRMZiQDZ9YNeLgLVL4OUbBLWQIhaSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6061
X-OriginatorOrg: intel.com

not_report 'outdated'

The base link is valid, but won't report to avoid possible noise since the =
patch was sent 20 days ago. Just record the conclusion.

This series is based on linux-next and 6/6 depends on [2].

[2] https://lore.kernel.org/all/20230327-tegra-pmic-reboot-v7-3-18699d5dcd7=
6@skidata.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, August 10, 2023 14:24
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH v2 6/6] regulator: pca9450: register restart handlers

::::::=20
:::::: Manual check reason: "git am base is a link in commit message"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230809-pca9450-reboot-v2-6-b98b4f8139d5@skidata.com>
References: <20230809-pca9450-reboot-v2-6-b98b4f8139d5@skidata.com>
TO: Benjamin Bara <bbara93@gmail.com>
TO: Lee Jones <lee@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Tony Lindgren <tony@atomide.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Dmitry Osipenko <dmitry.osipenko@collabora.com>
TO: peng.fan@oss.nxp.com
TO: rafael.j.wysocki@intel.com
TO: Jerome Neanne <jneanne@baylibre.com>
CC: linux-kernel@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-omap@vger.kernel.org
CC: Benjamin Bara <benjamin.bara@skidata.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 21ef7b1e17d039053edaeaf41142423810572741]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Bara/kernel=
-reboot-distinguish-between-cold-and-warm/20230810-032740
base:   21ef7b1e17d039053edaeaf41142423810572741
patch link:    https://lore.kernel.org/r/20230809-pca9450-reboot-v2-6-b98b4=
f8139d5%40skidata.com
patch subject: [PATCH v2 6/6] regulator: pca9450: register restart handlers
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: hexagon-randconfig-r045-20230809 (https://download.01.org/0day-ci/a=
rchive/20230810/202308101403.rZTxk0pZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a=
5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101403.r=
ZTxk0pZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308101403.rZTxk0pZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/regulator/pca9450-regulator.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val =3D __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_IO=
BASE + addr));
         |                                                         ~~~~~~~~=
~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from =
macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/regulator/pca9450-regulator.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IO=
BASE + addr));
         |                                                         ~~~~~~~~=
~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from =
macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/regulator/pca9450-regulator.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE=
 + addr);
         |                                                       ~~~~~~~~~~=
 ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE=
 + addr);
         |                                                       ~~~~~~~~~~=
 ^
>> drivers/regulator/pca9450-regulator.c:255:43: warning: declaration of 's=
truct sys_off_data' will not be visible outside of this function [-Wvisibil=
ity]
     255 | static int pca9450_restart_handler(struct sys_off_data *data)
         |                                           ^
>> drivers/regulator/pca9450-regulator.c:257:41: error: incomplete definiti=
on of type 'struct sys_off_data'
     257 |         int (*handler)(struct pca9450 *) =3D data->cb_data;
         |                                            ~~~~^
   drivers/regulator/pca9450-regulator.c:255:43: note: forward declaration =
of 'struct sys_off_data'
     255 | static int pca9450_restart_handler(struct sys_off_data *data)
         |                                           ^
   drivers/regulator/pca9450-regulator.c:258:47: error: incomplete definiti=
on of type 'struct sys_off_data'
     258 |         struct pca9450 *pca9450 =3D dev_to_pca9450(data->dev);
         |                                                  ~~~~^
   drivers/regulator/pca9450-regulator.c:255:43: note: forward declaration =
of 'struct sys_off_data'
     255 | static int pca9450_restart_handler(struct sys_off_data *data)
         |                                           ^
>> drivers/regulator/pca9450-regulator.c:889:8: error: call to undeclared f=
unction 'devm_register_cold_restart_handler'; ISO C99 and later do not supp=
ort implicit function declarations [-Wimplicit-function-declaration]
     889 |         ret =3D devm_register_cold_restart_handler(pca9450->dev,
         |               ^
>> drivers/regulator/pca9450-regulator.c:898:8: error: call to undeclared f=
unction 'devm_register_warm_restart_handler'; ISO C99 and later do not supp=
ort implicit function declarations [-Wimplicit-function-declaration]
     898 |         ret =3D devm_register_warm_restart_handler(pca9450->dev,
         |               ^
   7 warnings and 4 errors generated.


vim +257 drivers/regulator/pca9450-regulator.c

d5856c66c005da Benjamin Bara 2023-08-09  254 =20
d5856c66c005da Benjamin Bara 2023-08-09 @255  static int pca9450_restart_ha=
ndler(struct sys_off_data *data)
d5856c66c005da Benjamin Bara 2023-08-09  256  {
d5856c66c005da Benjamin Bara 2023-08-09 @257  	int (*handler)(struct pca945=
0 *) =3D data->cb_data;
d5856c66c005da Benjamin Bara 2023-08-09 @258  	struct pca9450 *pca9450 =3D =
dev_to_pca9450(data->dev);
d5856c66c005da Benjamin Bara 2023-08-09  259 =20
d5856c66c005da Benjamin Bara 2023-08-09  260  	return handler(pca9450);
d5856c66c005da Benjamin Bara 2023-08-09  261  }
d5856c66c005da Benjamin Bara 2023-08-09  262 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

