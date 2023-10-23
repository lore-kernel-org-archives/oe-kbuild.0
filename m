Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BA915B8
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Oct 2023 02:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvK0LRlC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698027412; x=1729563412;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MWbFpfG63h/MRcazgMxvcNHkR0rGSv1AEKcLe96IZII=;
  b=PvK0LRlCIc2p8E8a6kGGPkgDom+d8u+9pExZp5pnnd7on/Xskk1ID2so
   0kPr3WagONvKAVRDX4y8fgAUqr3znIrDBFI0f+8CSaIHHOWXXCu3EiqAg
   VICpWZzeUHE75SNrJJgHrTa7NJgb2Y4E+5lc8xmBBtxay0wQyGlnCPjzR
   oQFWp2LSxcVskE4FnNrABzSEmWxXc97mtfEukPUnuAfQFDwzOjvkq/S5j
   cDclqgDqs0z1dcI0KnqOzne5Nsnvfoffu4pK9/+m/I5AKzYINewAcVvRj
   +jKGWNxU7usGP492EWeKRsBKMQCVDw8n09V3WADdnvy8UPFjtROy97Am1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="383952052"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="383952052"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 19:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="881604724"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="881604724"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Oct 2023 19:16:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 22 Oct 2023 19:16:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 22 Oct 2023 19:16:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 22 Oct 2023 19:16:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 22 Oct 2023 19:16:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dk/68XRF4Mee3vSjdDbT8h23e52bijVykq74gLg5+wBPRb6Ki/qUicsK0KNldTsG0k1TAz6xzr0Irv/0KOgJfpGHQTk0HbNLUXvtkMQHD68DH8z5hgyLcM8kh7XaKBYvvabwJcjtnq02Ln8ZJqYskeZSSEllrkGw7+3jDvsPMdQMyTQ1X1u4akFQu4cAWKE1X/gogegcZKOytpGR5yvtuGjwuRW0iSDCRuPYvYB3uSXKQGG5x+xYBGKriweoF9/sFTGG7RxCs30KWkIdh3B5UA+3IjSGLmxRGaiVn0TG/Er4fsJU1JbpQLovCn22x33UcnDHZBvob2IM+Kjz0w+84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuMIUDd+AII8Cx20dEhat5sKWzZRdAU9n8FxYjJ2g/Q=;
 b=fHiKIOIGuatoVMpA/UozRuYyVagluLpDUKLR2YE4xRrI0pKSAFC132NySKyiay9YC9xB1e5FDdpNylIz0HyfWbIFePLSgrR2vgnqO4WckXdGqJ5iv1gQIZuqBdvCPx7tOiPdpiWNfWA/JLD2hmhF7kUUeL36FEbeRq7HsE4Kid7vRCcgBSunVoBS9yhLV2eR1oB8XKZwKnqfheozubmIClyLDf1yMONfbwdkaIL1AyXUaB7XUj4WXUBum2VyBDdo6I+fUY8G1qrPTI4+b5cthbMNljqkikrSEYkkjn2ZiXHH13y8wPcllxJKd7RvsRPexHcxXoslyjW8MTsUBFTT5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB7137.namprd11.prod.outlook.com (2603:10b6:806:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Mon, 23 Oct
 2023 02:16:47 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::21f8:775f:a94d:e1c0]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::21f8:775f:a94d:e1c0%4]) with mapi id 15.20.6907.022; Mon, 23 Oct 2023
 02:16:47 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
CC: "Li, Philip" <philip.li@intel.com>
Subject: RE: [PATCH] PCI: pciehp: Prevent child devices from doing RPM on PCIe
 Link Down
Thread-Topic: [PATCH] PCI: pciehp: Prevent child devices from doing RPM on
 PCIe Link Down
Thread-Index: AQHaBNOmGuF+7/1oB0GC6DjOuVjk/bBWpAXw
Date: Mon, 23 Oct 2023 02:16:46 +0000
Message-ID: <CY5PR11MB6392342987A4169709D2241FFBD8A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202310221806.gdrl0tU9-lkp@intel.com>
In-Reply-To: <202310221806.gdrl0tU9-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SN7PR11MB7137:EE_
x-ms-office365-filtering-correlation-id: 125c2732-b25d-47e3-a5ef-08dbd36e1bac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wMmZULfe2ve6cnDBierAcOdd+r7f9jjuXhaVL+4aDSaOaAg09j/nwB1K1yVqKsBlk6TQcN5fpzm2fkxqPd9UfdrhJTFWmcKiak8kddq4KPKWGIR4mH2kga1ErmlV+C1KgWFeD4zJCixx5DNAh+iJ7pabbt+Tqw3Gh+q+vVl8r5cbL9voVeb9MjKot+WdKIzvR6kJmMOFbDu6oPSjnmI5bwy1zq45vbpNlt/H1ZIIGhbYjsP/sMJJhtWn6F8zi5yqY/28b1Y84UEiMwkEgvXie9tYflNGF7aNO+XBA4DOYWP3xxtEb5GRbnlNbIL9gbtJWFWXXJFo1BKMlOZVZXWD/dLsCw6uIfYLcvMw18sgD/RUiiQ/GA1Xr7Ll2/Rv1IXpSTpd4YzSZ6w+pucQlWPKc4JqDEPtyLkkIt9M7Ax0SWiM4X/teFpfKlef6BMPgL0ko1u7kAx7D4qeU05hp7fYA8dSYZnv2UEt9d9iAZAMZqQSV+x8GKY325lw6BRylZqKpNsasdhMM37P5OXoYfL8UZFAWMRn1Eg+vN/OZnyumNUjbdNW2nr5mCb+soEIfcV8Q9ANyvm6mDj4ahOncOy8Dwx2jhv6suxtcyMknRPKEVVmpBdRkB89GL5DIqbJEFlF+kJ9y2kIhrQ4b7/+geHiNg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(41300700001)(2906002)(4001150100001)(478600001)(5660300002)(966005)(8676002)(8936002)(4326008)(52536014)(110136005)(66946007)(64756008)(66446008)(66556008)(66476007)(316002)(76116006)(83380400001)(86362001)(33656002)(38070700009)(122000001)(38100700002)(82960400001)(55016003)(26005)(71200400001)(9686003)(7696005)(53546011)(6506007)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PGSZiU0IJ+pOF/AVra+Q3/d2eNOj7kNc0iJo3uAQByQYw1+1DWjFAVYr4Ipj?=
 =?us-ascii?Q?Wgil4RkNopymakiVKZZBL/lFEaoDgv5we+QQu/Q4rM0+1TO+6kbzgycRu+e3?=
 =?us-ascii?Q?xh83MWjy+f+tRWApY/uLtDSiRmj4HAhRnJXdtVnGuYlAvP8h19jMgMO3i2R5?=
 =?us-ascii?Q?g1Erp9mi+ftvRfFCuLliY0cG9k9PonSIgDDRlGCJnvUOj8IraqffKjBvn9To?=
 =?us-ascii?Q?6SM0kPy/rgkbwkgwm5mh0VLr9jdu8RCh3me9qyB+ZbaBKsYjMMxPCnz1LVb9?=
 =?us-ascii?Q?Wv3YZoGTI2FYYCi6nN2KAQc5ONStUFd9yeijha02TpAkIPsoU2KIqasO0N95?=
 =?us-ascii?Q?Z5JxA9xR1Wy5sc2t515tyZC01TqHr6d0vWF8XHSHCzz4SlwcJF/azh8KQgfR?=
 =?us-ascii?Q?HObGNZN2YORx6y1NL8dFIjxuyZxv/twGrjPrsXiMIKLSdG+cStl/GrIIVFRC?=
 =?us-ascii?Q?bjbVshRM+Sh+oEftI2YmKeGq6yFV6u8iTWd/INDV4RZ2N7uXi+S/5FO2WIWe?=
 =?us-ascii?Q?70eDEUS4D4Jgt1wElkceaGvGHUW9n9L3zS/sByo9e4mLQQklY/XHsUP4B//i?=
 =?us-ascii?Q?hjUqiv9xv5GaZnXafhomt1fEn3ub3lSj0KFvZ7QeH02liySljsNQUQgg6X2C?=
 =?us-ascii?Q?hUFVO4JJkUMhpKxo49xgJJ96kjuvnlYBmTv70+W06l6vX7kYf2nIzLUGoeiu?=
 =?us-ascii?Q?JZvqVX6cT4o/rCFL013Jn5e5MJoJsIMlNA5J/spr8KcMHzUCJzER3MyW2QtW?=
 =?us-ascii?Q?kq72WuoIEzksqr/lIuWD37plPi1om0gdqF0Jo9CrebAfIzCSB+Qe+SKkeWFd?=
 =?us-ascii?Q?Xmc+3XxvMKnrbyaJ71+tu0JATdO6jSHHiwWQ/CoxR0eVIEbQE9j4cSy1P+WD?=
 =?us-ascii?Q?mvlTwm0dVkSWkEtLuHrG/0KMVBp3b8Fkklto8OWR7L0lsI2WFYOQYDCwrcG4?=
 =?us-ascii?Q?2WXxlphCqVhiWBpAHKIoJ/tbv8WFqPAPGg8XWX9YqeSAdKEqpAZ9aH/EYU+P?=
 =?us-ascii?Q?gQS10ytom6GKs0+xf5EYUpNv8PQ6vRCh/vOgl5eUM4nv98unMuXuLsKkro+u?=
 =?us-ascii?Q?UFv6SSgZWbrxoAngkd1SLC7OsmFX7YhVf2TatuKWeR/U/fMtUaGhLKzgou7D?=
 =?us-ascii?Q?FQyR5xdiX4aFn3wMlNZ2eIyfypujhKSORn5awUI6rdyz+b4sOIgCtBwQFkgp?=
 =?us-ascii?Q?joWi55+4UWGV5S7+CHIGudHF9ogfkb+cl0iCxv2wCAKoZdAePNuRda2h1brm?=
 =?us-ascii?Q?28VOKEcostfBYpAahBNcHu2atPmzsoAWisou6iOCkbD5Zt88U0XP93OvTCms?=
 =?us-ascii?Q?cBEtOnBDXuqmoomcRpatWQDMgMfcQxG7vv4jrQGTpBpFSB/BIz+WoxDX1LqU?=
 =?us-ascii?Q?BMks2b4RIsu446iquJZewrasWkjRfkruNDvf+onAGwl8HfgYpOYeaLtybVHY?=
 =?us-ascii?Q?baD5Wl3zR4F1FaLcMfYcWr4ew/2el5Nkcd81xpm9WPknnuDUiS6tKUfkjC8R?=
 =?us-ascii?Q?e+KhO0SBvCbXj9LikdAjzLDzwV64q/Z9xclZGUFMxqb8+0RiOIW2nwF47AoQ?=
 =?us-ascii?Q?+GYeA4WSPBQOiShQ9DwUVFbb8XrdeMUT8849cXa8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125c2732-b25d-47e3-a5ef-08dbd36e1bac
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 02:16:46.7098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8zO+a5OKdnXQtWbIsDxg1gjRLGQgg+A3SSKDtVu+tfYW5gsSH9cZXIDGhzEaPEs8S71c4frAriTllUqe04Uxag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7137
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/r/202310171955.hlish6FZ-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, October 22, 2023 18:35
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH] PCI: pciehp: Prevent child devices from doing RPM on P=
CIe Link Down

::::::=20
:::::: Manual check reason: "git am base is a link in commit message"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231016040132.23824-1-kai.heng.feng@canonical.com>
References: <20231016040132.23824-1-kai.heng.feng@canonical.com>
TO: "Kai-Heng Feng" <kai.heng.feng@canonical.com>
TO: bhelgaas@google.com
CC: linux-pm@vger.kernel.org
CC: linux-mmc@vger.kernel.org
CC: "Kai-Heng Feng" <kai.heng.feng@canonical.com>
CC: Ricky Wu <ricky_wu@realtek.com>
CC: Kees Cook <keescook@chromium.org>
CC: Tony Luck <tony.luck@intel.com>
CC: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: Lukas Wunner <lukas@wunner.de>
CC: linux-pci@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-hardening@vger.kernel.org
CC: bpf@vger.kernel.org

Hi Kai-Heng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.6-rc6 next-202310=
20]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kai-Heng-Feng/PCI-pc=
iehp-Prevent-child-devices-from-doing-RPM-on-PCIe-Link-Down/20231017-142208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20231016040132.23824-1-kai.heng.fe=
ng%40canonical.com
patch subject: [PATCH] PCI: pciehp: Prevent child devices from doing RPM on=
 PCIe Link Down
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-005-20231022 (https://download.01.org/0day-ci/archi=
ve/20231022/202310221806.gdrl0tU9-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231022/202310221806.gdrl0tU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310221806.gdrl0tU9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/hotplug/pciehp_pci.c:25:5: warning: no previous declaration =
for 'pci_dev_disconnect' [-Wmissing-declarations]
    int pci_dev_disconnect(struct pci_dev *pdev, void *unused)
        ^~~~~~~~~~~~~~~~~~


vim +/pci_dev_disconnect +25 drivers/pci/hotplug/pciehp_pci.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  24 =20
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16 @25  int pci_dev_disconnect(struc=
t pci_dev *pdev, void *unused)
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  26  {
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  27  	pm_runtime_barrier(&pdev->d=
ev);
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  28  	pci_dev_set_disconnected(pd=
ev, NULL);
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  29 =20
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  30  	return 0;
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  31  }
2bd1cb5c4e67115 Kai-Heng Feng  2023-10-16  32 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

