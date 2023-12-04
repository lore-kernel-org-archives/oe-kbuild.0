Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847AC9449
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dITc7a0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701657245; x=1733193245;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xW+yz30uy4IIJaMarO6prvCc4M7kgChkgX9utD7Qhs4=;
  b=dITc7a0/Ij40Isuollk1TEdCBPkmohnjxZBODjX8lo8CKHgx/ofAATkO
   AKCH8QC7IxH/lai5gPn9uABYETicd3AqhIsRYqEZnr9Y3SNcdqhrD7IH2
   hvtG9J1YKcZcPq8/mMIL5Tu0BQz5CHtjDOp0/i2uGG7f/3hn9UhK+amRK
   MpuiXs3C6Hq6sYyMZSZMahJ6gzJIcufpDdgGGv1OmNFjfrsNRnGxhpAms
   P+BxbQHwPlU54B7tKRv5gaZNYXteKxCts6TRiCbp3islKj5pdTLEH3lSa
   1BqQTNbUY+lrBmDazZstpmIeO6FVIASUGynRl/h0N3OnBEc0Te4f5+ecN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="378707919"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="378707919"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:34:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="763794578"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="763794578"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:34:04 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:34:04 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:34:04 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:34:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g231lQt7QWAa/KKMZgdCeNWlvxnpm+G4RPr+4qeNLrsZ6HZMcJBAID+xXeXJcm3SaV+LjLh3fQUIAmkqQ0wOMUjlkrbd6B8seDuUPwPf0r3KM2REad3e/svgOJehW9gTxVPPFesjT2rGTtOeNG8BZVXB3cUjkroDMc43XBiE3vxL0GN2u/HXG2U6biwElpH3UmodRgqcEjarW8+g4YH6LUaLNt6ISgPO6kW/vZuoHzoExnVBRqPJPLc/sQ5zTK+7/qtgBjNW5iTDA6Qy90i0x6Ao2ZQV+s7UDuVFbS/6foeCr4Vdl6NUkGu4+jy/+AM0sq7FYdenLQkPnyPBnbzb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6Xj05Hashai/qZcdfVnmuy/yp4LLRcMw2Z8aKEpXBw=;
 b=SsgUwS4Iduffpm27G4L/3f/CquRuBQOvWqabwAamZTTAPM4flBq3XsogSo8hoJ1NKMrq6Hq0DKwHxGllM2UebZ95ie4MsO9MNkiRlHgajBx75fp4saVhZjgok31OHUvPKbIE0R0Xt65U06UF2UhA+xhY+4VMQ3ML9WRk/stD/XCqL/4v+I5iQ4M+MtkrdspzfR/DIT0u59Hj9iYnWJFo9sUBCRHekC1CeLioBgyc+FTm9tq7jc1BvoHURPKG0Cc8ymCe9KcR2x1jZe5dnMbDmEGb10CtUXu+5C26g4p6N4C5/Xql8fYuOiI5WebgDJubvQjfCW4TQgf2vbLdWwaB8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH0PR11MB5641.namprd11.prod.outlook.com (2603:10b6:510:d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:33:56 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:33:56 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: arch/arc/plat-axs10x/axs10x.c:382:6: sparse: sparse: symbol
 'coware_swa_pid_offset' was not declared. Should it be static?
Thread-Topic: arch/arc/plat-axs10x/axs10x.c:382:6: sparse: sparse: symbol
 'coware_swa_pid_offset' was not declared. Should it be static?
Thread-Index: AQHaJJg9YNdHjQtG+02ZfzEUM/SsqbCYaycw
Date: Mon, 4 Dec 2023 02:33:56 +0000
Message-ID: <CY5PR11MB639207A572751B7F71F06952FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312020444.TVaqgtVQ-lkp@intel.com>
In-Reply-To: <202312020444.TVaqgtVQ-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH0PR11MB5641:EE_
x-ms-office365-filtering-correlation-id: ed8f478a-eb1f-48df-1e17-08dbf47176ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8EpQuO9keF4W/FYRzjNdV5ZI2RyXRb7g41NrFmkUbIQ1eSZUVVJ4pFhESo3R8i3nQUsersUbeqmjjsa6RtDNRt3o+mx4nlJ/uszcX2AmGiUN9ssWrg2atcMAu+7S5KofN3NgfzxpsLliHjNfisCVB97zB8sNdnhdsIbbLVjwIU9vcnnLfPPhuMfX/ROTDKWIGtMeQW1rxYBKLilbQxg8P/79DVRtSGg6JE7uIKG/WCIS0KxFGAstVTdrE2l1OM0Lv41658GNdF/s5oM1vGrd+bduKN0sZdBfbCj4o9d5i+C2xDvyRLHY+1nfeVlfySrEudkXV3WMZVD5fwXEyd8kp8HfGU66yVh1ricZ67vWOORwuBWUChyOTz0JJfR+W7y/x3uV52XXPFvVBj3mdWC7W9u2+Wh/XRYPaacT7Kqio3r3xPA0FccvBZvaO5xjGc7X/w5zHFrYa5OXLqEAPPAumrhIltES5HV/yNXyCKR2/Ptm+2V/09J+FY4dcTZbDTnJ+wBw6GJHEJ8UezM5PULIsi03pNuHPk1OwM7NnG4BlBmHdw56NYmtuzfpsIbreyxfkc0Q50ePU4zMUpbDe1+xQKgJ6Oil/v/Ijldz0EmqRZkVA+xcliQKI2Iz1mVZqxHyCDG0pdIZtQJ6wfrafshMXmoW5ijehVGL8Iorx6y0ht3y/4PCtp4bW9ZZIg709UTd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(82960400001)(38100700002)(122000001)(41300700001)(26005)(66556008)(66476007)(66946007)(76116006)(64756008)(5660300002)(66446008)(8936002)(8676002)(52536014)(316002)(110136005)(9686003)(53546011)(6506007)(30864003)(71200400001)(966005)(478600001)(2906002)(7696005)(86362001)(38070700009)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?etnI4V2GcCjWqT0e4+FOZtN5tSrlpSBLD9PrHzxOvWttqbV0oJfhZTYwODJi?=
 =?us-ascii?Q?1fWl4+9LcVmY0J3VsneIf+37d8FNV6qxyGPquIsfdmuLvyyi8GkWh90cjAHA?=
 =?us-ascii?Q?nubllWN9XHo/uG4hqbPz+L0yqa9+CVD/1Cxifh8gawWvPwpatHf893oER9Qs?=
 =?us-ascii?Q?n/SoRi6fYlH1daD9mHtvD/CWfp8ibmPRxkKDV0a62ZD0FsSkKxyru89zTYqp?=
 =?us-ascii?Q?gqA520SzADTDJMWhbkitBd+e4yyIoBOnSf+2X0pGVVxnRpA/PUn/tfhJd8lo?=
 =?us-ascii?Q?uaZ9/gG6QKeBrcC3S6uFZfCsD9zzPE8Yt4bUEihEDlARTQANYyLiHto2/ReM?=
 =?us-ascii?Q?kKJtfBwpD0YjKmovAzsLz2CQlZ3NW8M5+y3PpMJTsX6ZW9XOdPO1BwLjOAzr?=
 =?us-ascii?Q?pMgHyuzr6FYgZPJdNP/E+WIm8ZqCnb/T2PVno9tLcLf3hJwpr9zO8T+0iUX6?=
 =?us-ascii?Q?4IkaWGd5mJ56R0VuYXAHCjxUrG6NnFdZVaTi5GukGO5TRWRG7vHEzPbpgQWv?=
 =?us-ascii?Q?ZyOdfoz4B8dboBh1wG5zLyAaLzYk0Et4hNws6wheStr+n65ufl/icBu4uzPg?=
 =?us-ascii?Q?+NmCkRQQYMDD2I2MqxyDiCu7eeokBnCWNjy4WggWRBQriTck3aghco/uY4Tz?=
 =?us-ascii?Q?SILPGGpXYCg5pfah5q3fhJFS1P8bdox136SPA6+bTHjE7xK8HxN3f1FzSAz3?=
 =?us-ascii?Q?m4jCtL+8Z+A1nS920Zc1CQb0Uxl0zabUI7OA94RqaGeL4Bnd7E7JUn92A5TU?=
 =?us-ascii?Q?EzRAD+hXFlVa/n4N6wsAk6f38alrFHuinhbhK97YgAOTxHeT/n8PKQlqtKIm?=
 =?us-ascii?Q?2mNzuWf0JPOikBN/Ryc6ZfQwLaCw6JG6qgzWmqmFedCp2nSciopnFVkkYmYp?=
 =?us-ascii?Q?G/tbnV0IqtpXV9F8Yxf6s7AIFJkhtdalgDoT4B5Ce96A28IAwSZoTzhKzEXT?=
 =?us-ascii?Q?rvZ9/182QX6E2AdEeK1/Qdn/ofn01XHAuwfeOIh8z6Huw45it3juhE/AOf3t?=
 =?us-ascii?Q?HNu9TuG826XlS6ZMeJRmS0fQnGo2F4iH2XEExfuSgPCOAlJPGsjwQFWrFk9J?=
 =?us-ascii?Q?iU/kwfj78CLXIohb0B1RMSp3AtuWQ2gOlXX0ove/1c6MXQuJgd2PtS1TwuvY?=
 =?us-ascii?Q?u3SVV/3/YXdEjNO0H9mKIHbj+r/ys/JwrDBkFVwq9MTLrQpUfTzu6ja9ABnt?=
 =?us-ascii?Q?neCfg4IQw/kA3F0yggSpGdfPwWdJs+PT2iBifN3loT1a+cGQfjkH7mNTZZ0K?=
 =?us-ascii?Q?t45e2FVLJ+YynOjfqjCNfCmIIVC3FOT+hkc6Tg4Dr2UrfoqraqEPuVDhix90?=
 =?us-ascii?Q?w5zionegl7LNgoDY/drzI1vv23d8gMecEz1qzZZHozF/ITPa1YSzNvZLNbho?=
 =?us-ascii?Q?e4v+Ob11sTbhIE9Ob/EWAq4w29YUXNN0ehiZdpkt89Raz+VajDIphDezdBNO?=
 =?us-ascii?Q?A5sMc0HxRXpnX7vhKENMVukbGmXy6Tc2aF3O096xSE+LMlplIPTcKYn1FnfG?=
 =?us-ascii?Q?Q192D3T09F9yaV+/ETV2rwUu5VoWeq2BolndIQvJsm3pBz+7vGDIMdHUb+/V?=
 =?us-ascii?Q?59a5Cup8sKBMGOroj4z2mrqjR/W4oUH/uxUS8+cz?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8f478a-eb1f-48df-1e17-08dbf47176ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:33:56.6245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZL+kDibPqPW49EDXwLE+1Jm0UBN8sVOg8cUjPQ82uFqRw+mVPRr3JmuRUZy+gghi+6oH0ncnqi/2MfqFLglCtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5641
X-OriginatorOrg: intel.com

not_report

only Makefile change.

Makefile | 90 +++++++++++++++++++++++++++++++++++++++++++++++--------------=
-----------------------------
 1 file changed, 47 insertions(+), 43 deletions(-)

No relation with the sparse warning in arch/arc/plat-axs10x/axs10x.c

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, December 2, 2023 04:51
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: arch/arc/plat-axs10x/axs10x.c:382:6: sparse: sparse: symbol 'cowar=
e_swa_pid_offset' was not declared. Should it be static?

::::::=20
:::::: Manual check reason: "only Makefile file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: b1fbfcb4a20949df08dd995927cdc5ad220c128d kbuild: make single target=
 builds even faster
date:   4 years ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 years ago
config: arc-randconfig-r111-20231107 (https://download.01.org/0day-ci/archi=
ve/20231202/202312020444.TVaqgtVQ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020444.T=
VaqgtVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312020444.TVaqgtVQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arc/plat-axs10x/axs10x.c:313:35: sparse: sparse: undefined identifi=
er '__builtin_arc_lr'
>> arch/arc/plat-axs10x/axs10x.c:382:6: sparse: sparse: symbol 'coware_swa_=
pid_offset' was not declared. Should it be static?
>> arch/arc/plat-axs10x/axs10x.c:383:6: sparse: sparse: symbol 'coware_swa_=
comm_offset' was not declared. Should it be static?
--
>> arch/arc/plat-hsdk/platform.c:16:5: sparse: sparse: symbol 'arc_hsdk_axi=
_dmac_coherent' was not declared. Should it be static?
   arch/arc/plat-hsdk/platform.c:27:17: sparse: sparse: undefined identifie=
r '__builtin_arc_sr'
   arch/arc/plat-hsdk/platform.c:34:17: sparse: sparse: undefined identifie=
r '__builtin_arc_sr'
--
   kernel/signal.c:1245:9: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1251:29: sparse: sparse: no member 'ip' in struct pt_reg=
s
   kernel/signal.c:1251:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1251:29: sparse: sparse: no member 'ip' in struct pt_reg=
s
   kernel/signal.c:1251:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1251:29: sparse: sparse: cannot dereference this type
>> kernel/signal.c:1251:29: sparse: sparse: non-scalar type in conditional:
>> kernel/signal.c:1251:29: sparse:    void
   kernel/signal.c:1370:27: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   kernel/signal.c:1370:27: sparse:    struct sighand_struct [noderef] <asn=
:4> *
   kernel/signal.c:1370:27: sparse:    struct sighand_struct *
   kernel/signal.c:1948:65: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct task_struct *tsk @@     got=
 struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:1948:65: sparse:     expected struct task_struct *tsk
   kernel/signal.c:1948:65: sparse:     got struct task_struct [noderef] <a=
sn:4> *parent
   kernel/signal.c:1949:40: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile *p @@     got =
struct cred const [noderef] <asn:4> *[noderef] <asn:4> * @@
   kernel/signal.c:1949:40: sparse:     expected void const volatile *p
   kernel/signal.c:1949:40: sparse:     got struct cred const [noderef] <as=
n:4> *[noderef] <asn:4> *
   kernel/signal.c:1949:40: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile *p @@     got =
struct cred const [noderef] <asn:4> *[noderef] <asn:4> * @@
   kernel/signal.c:1949:40: sparse:     expected void const volatile *p
   kernel/signal.c:1949:40: sparse:     got struct cred const [noderef] <as=
n:4> *[noderef] <asn:4> *
   kernel/signal.c:1992:54: sparse: sparse: incorrect type in argument 3 (d=
ifferent address spaces) @@     expected struct task_struct *p @@     got s=
truct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:1992:54: sparse:     expected struct task_struct *p
   kernel/signal.c:1992:54: sparse:     got struct task_struct [noderef] <a=
sn:4> *parent
   kernel/signal.c:1993:34: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected struct task_struct *parent @@     =
got struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:1993:34: sparse:     expected struct task_struct *parent
   kernel/signal.c:1993:34: sparse:     got struct task_struct [noderef] <a=
sn:4> *parent
   kernel/signal.c:2022:24: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct task_struct *parent @@     =
got struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:2022:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2022:24: sparse:     got struct task_struct [noderef] <a=
sn:4> *parent
   kernel/signal.c:2025:24: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct task_struct *parent @@     =
got struct task_struct [noderef] <asn:4> *real_parent @@
   kernel/signal.c:2025:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2025:24: sparse:     got struct task_struct [noderef] <a=
sn:4> *real_parent
   kernel/signal.c:2506:52: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct task_struct *tsk @@     got=
 struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:2506:52: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2506:52: sparse:     got struct task_struct [noderef] <a=
sn:4> *parent
   kernel/signal.c:2508:49: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile *p @@     got =
struct cred const [noderef] <asn:4> *[noderef] <asn:4> * @@
   kernel/signal.c:2508:49: sparse:     expected void const volatile *p
   kernel/signal.c:2508:49: sparse:     got struct cred const [noderef] <as=
n:4> *[noderef] <asn:4> *
   kernel/signal.c:2508:49: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const volatile *p @@     got =
struct cred const [noderef] <asn:4> *[noderef] <asn:4> * @@
   kernel/signal.c:2508:49: sparse:     expected void const volatile *p
   kernel/signal.c:2508:49: sparse:     got struct cred const [noderef] <as=
n:4> *[noderef] <asn:4> *
   kernel/signal.c:3676:46: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected struct siginfo const [noderef] [us=
ertype] <asn:1> *from @@     got struct siginfo [usertype] *info @@
   kernel/signal.c:3676:46: sparse:     expected struct siginfo const [node=
ref] [usertype] <asn:1> *from
   kernel/signal.c:3676:46: sparse:     got struct siginfo [usertype] *info
   kernel/signal.c:1289:9: sparse: sparse: context imbalance in 'do_send_si=
g_info' - different lock contexts for basic block
   kernel/signal.c: note: in included file (through include/linux/rbtree.h,=
 include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:649:9: sparse: sparse: context imbalance in '__=
lock_task_sighand' - different lock contexts for basic block
   include/linux/rcupdate.h:651:9: sparse: sparse: context imbalance in 'se=
nd_sigqueue' - wrong count at exit
   kernel/signal.c:1929:47: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:1949:40: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:1949:40: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:1949:40: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:1949:40: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:1967:19: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:2088:13: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c: note: in included file (through include/uapi/asm-generi=
c/bpf_perf_event.h, arch/arc/include/generated/uapi/asm/bpf_perf_event.h, .=
..):
   include/linux/ptrace.h:99:40: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected struct task_struct *p1 @@    =
 got struct task_struct [noderef] <asn:4> *real_parent @@
   include/linux/ptrace.h:99:40: sparse:     expected struct task_struct *p=
1
   include/linux/ptrace.h:99:40: sparse:     got struct task_struct [nodere=
f] <asn:4> *real_parent
   include/linux/ptrace.h:99:60: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected struct task_struct *p2 @@    =
 got struct task_struct [noderef] <asn:4> *parent @@
   include/linux/ptrace.h:99:60: sparse:     expected struct task_struct *p=
2
   include/linux/ptrace.h:99:60: sparse:     got struct task_struct [nodere=
f] <asn:4> *parent
   kernel/signal.c:2299:13: sparse: sparse: context imbalance in 'do_signal=
_stop' - different lock contexts for basic block
   kernel/signal.c:2508:49: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:2508:49: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:2508:49: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c:2508:49: sparse: sparse: dereference of noderef expressi=
on
   include/linux/ptrace.h:99:40: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected struct task_struct *p1 @@    =
 got struct task_struct [noderef] <asn:4> *real_parent @@
   include/linux/ptrace.h:99:40: sparse:     expected struct task_struct *p=
1
   include/linux/ptrace.h:99:40: sparse:     got struct task_struct [nodere=
f] <asn:4> *real_parent
   include/linux/ptrace.h:99:60: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected struct task_struct *p2 @@    =
 got struct task_struct [noderef] <asn:4> *parent @@
   include/linux/ptrace.h:99:60: sparse:     expected struct task_struct *p=
2
   include/linux/ptrace.h:99:60: sparse:     got struct task_struct [nodere=
f] <asn:4> *parent
   kernel/signal.c:2591:69: sparse: sparse: context imbalance in 'get_signa=
l' - unexpected unlock
   kernel/signal.c: note: in included file (through include/linux/uaccess.h=
, include/linux/sched/task.h):
   arch/arc/include/asm/uaccess.h:619:33: sparse: sparse: incorrect type in=
 initializer (different address spaces) @@     expected unsigned char *d_ch=
ar @@     got void [noderef] <asn:1> *to @@
   arch/arc/include/asm/uaccess.h:619:33: sparse:     expected unsigned cha=
r *d_char
   arch/arc/include/asm/uaccess.h:619:33: sparse:     got void [noderef] <a=
sn:1> *to
   kernel/signal.c:3736:58: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected struct siginfo [usertype] *info @@=
     got struct siginfo [noderef] [usertype] <asn:1> *info @@
   kernel/signal.c:3736:58: sparse:     expected struct siginfo [usertype] =
*info
   kernel/signal.c:3736:58: sparse:     got struct siginfo [noderef] [usert=
ype] <asn:1> *info

vim +/coware_swa_pid_offset +382 arch/arc/plat-axs10x/axs10x.c

5fa2daaa8d8223 Vineet Gupta 2015-03-09  378 =20
2924cd18c434c7 Ruud Derwig  2014-12-03  379  /*
2924cd18c434c7 Ruud Derwig  2014-12-03  380   * For the VDK OS-kit, to get =
the offset to pid and command fields
2924cd18c434c7 Ruud Derwig  2014-12-03  381   */
2924cd18c434c7 Ruud Derwig  2014-12-03 @382  char coware_swa_pid_offset[TAS=
K_PID];
2924cd18c434c7 Ruud Derwig  2014-12-03 @383  char coware_swa_comm_offset[TA=
SK_COMM];
2924cd18c434c7 Ruud Derwig  2014-12-03  384 =20

:::::: The code at line 382 was first introduced by commit
:::::: 2924cd18c434c79ee777dc63616a8505045d7509 ARCv2: [vdk] dts files and =
defconfig for HS38 VDK

:::::: TO: Ruud Derwig <rderwig@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

