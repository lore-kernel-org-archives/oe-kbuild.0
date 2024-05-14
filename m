Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21641EC5
	for <oe-kbuild@lists.linux.dev>; Tue, 14 May 2024 01:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715649517; cv=fail; b=ZPLSNVeMRoOe2fNGz8q/4R7j5PXIlhtcs6LmCVKSUjDEXuMdt4SmyrxrBda/7/mDLBi/AkB0N6QA0ExyCwJ59PVNNGLgaH+2SsKcSe5riydGjKvP2CParatUrytI7Z2dlVpjfE7pUT4XHAgYkByaP/qKmi9qNtJa4r7FPGGBt08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715649517; c=relaxed/simple;
	bh=4X11RpWXZ7fXYbYXwb85KJ9AdEMnab/TLyRijEiaKb4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JJAV/A22e93w4H1c8OyLUPNrkQ+k9G8KupSCltE/8Dx17wfRKXJY8LcG0mCOndvpLxQWjLGk3LzUQvjl0sSne4Mp0D3S61tbtUHWtqTuN17s65N+dq22CQdE4NKXQ1E/FkG73TZzNHfdpBS5x7sLm4e3zsIWhc15yHQLUAeYAxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRVpEO4U; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRVpEO4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715649516; x=1747185516;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4X11RpWXZ7fXYbYXwb85KJ9AdEMnab/TLyRijEiaKb4=;
  b=bRVpEO4UAEawPh7/PGaNXCnUE3K2p26E9MSuXLVwqcjKYRyBVQroUULt
   PkQ3YvowYng/cZgzJB1PUrbX0NGH8F5yNyzX09+KMDdXQsmXEB7c08hla
   hLnBbTTkbkrpdS3zR4tLM9dgHpWYrhKfuib58hNn+n1rKPVglO0AhKusf
   9VmM1Lzf0jdlisUvGeCs/WEv11GYg0HtsnhOHarRZlHsg8FDqtHUhO0ta
   gTu+scjLqvwbaEUN9oYG0tazJYfgao1tpAjTozz8rcwe62qxMIOdN1/yk
   tLLhjVQqrgkFkwwO3hvXJ8GdEy8AH1FbOFGcaTodZFwaj+GmMXeJRpuHv
   A==;
X-CSE-ConnectionGUID: iV9emmEOQ3qas53kUskLOA==
X-CSE-MsgGUID: HdnpHhndSOm23cNcszredQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22758785"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="22758785"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 18:18:36 -0700
X-CSE-ConnectionGUID: xB3NSxZXRtqUM43t9FlAQw==
X-CSE-MsgGUID: 7f2jUMwrTFeKn1Y6FjoIrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30348936"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 May 2024 18:18:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 18:18:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 18:18:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 18:18:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 18:18:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIXGmSS/zTWbLHsjXm7dBknmCFuUKsMozvHfSlfR8FHZKbvhmpgFkc298IxeZzI9RmdS5Sqh4kjGzHUlWVeL3cTBhegA4+kdV7+Icshc38A48m3vecDkhIJjNnWGDsv0+k+a3QkS+KZEaeC8MdELgJmaNtYneuOxo0ZGAG3B1ZBjsew4Z+wZCdHZhj75lXfi8Mbfbq88CRIPwKwRN7Ht8+ePpnTOBOc7AnIzUQEJSOohaB9RTC7jPT2JYhIc7Q0UxemLtENdukQvxbSWocDfNOIR95YJK4R6pZr/EHpB4Pj7JIJJIMOYE020RaUGMUFZbqgymGeflCKYf/vhlpzXlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CSaODnm48phnOyn1FY7N+KiNMTVZKtwHrj4QaET1bU=;
 b=ZC4+Lo+jTyzE3XMZBmMPC88i8ukxx9+qri86n+MpKQvTqcNq0A89PWP9E0x7dc4S+s7TNmehPBcy0lFRy+x5rzxjrlKtT0NA1Lmi/e4bhBIjtpHtkPvKzz/vuI8EdusIgQ5BXhDIbzZPZc6ia3udMeavzrQchRY9BBnOyT59nNp/QgQ2Q6+RVoIUhjn3qTjqoLXJRnx8HLj6pXUh82nnjQ/CrtGCpWvTOFfwPHsHcPSTtzdMbCur9+1r8cZNLE6BgIrkfJTuxtiAzijrBE3iSRJ9/2eutK/b/X5HqeGy6267QLejMMusqo2GqvPQjI1xySfYRhyWW4Nn5vzZMnMDQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by CYXPR11MB8664.namprd11.prod.outlook.com (2603:10b6:930:e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 01:18:28 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 01:18:28 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [arnd-asm-generic:syscall-tbl-6.9 45/46] arch/arm64/kernel/sys.c:
 asm/syscall_table_64.h is included more than once.
Thread-Topic: [arnd-asm-generic:syscall-tbl-6.9 45/46]
 arch/arm64/kernel/sys.c: asm/syscall_table_64.h is included more than once.
Thread-Index: AQHapZl6hP2u2tgpQEOfgm02VVMLpbGV7eUg
Date: Tue, 14 May 2024 01:18:28 +0000
Message-ID: <SA1PR11MB8393C7363D6D67D4088C8579FBE32@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405140838.gXq6QcpD-lkp@intel.com>
In-Reply-To: <202405140838.gXq6QcpD-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|CYXPR11MB8664:EE_
x-ms-office365-filtering-correlation-id: d45ee4d8-70a8-4a78-697f-08dc73b3c314
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?OSpshbgwSWl7EpyalGxZHmLAFA+jEjGGZsGlwKYsPd4Hz3CW62NX2CpUK5A7?=
 =?us-ascii?Q?5gtPvFQYei+9Hkv6SqWIFtLxx3GVZXsWrsMyK816ByZFHCn6a3O8DhgREI8B?=
 =?us-ascii?Q?7CxsAhwgL0o75yrsGTBBE/5XigdLpWMML+T/nvd2nnB9OKRlvXxqhqUL0saJ?=
 =?us-ascii?Q?wLLgBm54rkYCh3yYA3QXF0fk0711uUrBFxyG+x2HBUssveZnqa2aEQvRYbLf?=
 =?us-ascii?Q?rXhTFb7bANid/gOnHnjjUHLZEoI2DgVDrNDICrElJhuDOQC5/UZIzbyb78WF?=
 =?us-ascii?Q?mFewUzhpQgQBexWfwuNn8xguhJVAtqyvv+xOgbWL4RgnfcwKJgzBFBvn+iwY?=
 =?us-ascii?Q?d5sReSmHI6+K6VwaGo883irsS8n7jdZufVkUt0Oru5ZWg1b6EpIEyajtSI/S?=
 =?us-ascii?Q?Q8iSCMPeepa4/rTOshzKP9lwPJTWmK6p44kuGQn6G8S6p59zYHhPo+FszBas?=
 =?us-ascii?Q?etwch6pDp22xHJEfsm3tDCO/KRzx9KFCNzu9TO7HtlP4Wl0AqUxF7FBrqiBE?=
 =?us-ascii?Q?GkAeZ7QgH2YN4kCTO0+YvAQ2qhVCC63yIkUugnxxV9qDfGZDbMhvbCA6bow+?=
 =?us-ascii?Q?DG7ljdB1pHubOXyydv+/0HXqDP/H8CIGseYXUflS8VSyg8qCP4X82L8I/N29?=
 =?us-ascii?Q?1TL+jt9QTpn/vDSQ8kdBIsoF3CTZttDGoYQBH8YMWM+HCeNewQpnV3HR16aU?=
 =?us-ascii?Q?15VVPU4H4l8CnbtLCix+3vLIsaIl2xe1X3IS/qnEqvjGdS7wj3kqMZS/mnOw?=
 =?us-ascii?Q?XOCkGG+fBnNrN3RQ3kARjNyXFQgpxw4f6bJ/eWCrOwQzzq3U5wZV7g58CnPQ?=
 =?us-ascii?Q?cR5nXptpnjCBqijF/UF4mM5A/uA5O9HE9GpXee2A37lPqlHRlaE8NbTsan08?=
 =?us-ascii?Q?Civtn0pjWYKt81oFRWm+dAHdxZ9vpIO3WNPbO7pBLYXWpipMdjJKaWOQtL1v?=
 =?us-ascii?Q?DKG88JArBcc6TlL9+54sQ0VsKJ6qiKYtOP5Uc77ZtM6YMF+Ea4sgnuKrNBKN?=
 =?us-ascii?Q?bZ7ji36q0/LhYe/V8xsYxw4OPxQHDeyRQtx2ARoqtjwpAshHNNdk08Y/Iqm5?=
 =?us-ascii?Q?foQeXXOlyLXsNMA3UYKM4p7ES5tXGW5zlHCk2c6CynV2Dc5tOFOLB7bqH6bP?=
 =?us-ascii?Q?dkue6FUgzA3E+zQWY7ajMdygzRq8qUPhDMDapP5rd6dvcM+m/0y+rxLK7u7a?=
 =?us-ascii?Q?tHxA514VQFYMeO+2qbTpnK1dsL7JFrsZVEMQxZ0d2ezSsjjFUPIgJCjO0SuV?=
 =?us-ascii?Q?+HFHlpN8PJsSt1DZixg2psvBnag16yyPG3v+lxkIz6ZyV/MpzbCgsUbj+GDK?=
 =?us-ascii?Q?uBs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Bc5CDaYt3Wn0BFLIV1CRkQe82wUECby6B6oka8RfK9QSrNnuIt+iJ3WVRYZX?=
 =?us-ascii?Q?Ai9CVHtC8aUBUOmBkpPsDJQVN4mYBaoQJsE09VOWrTjnODnpbVF0DEdi0i1p?=
 =?us-ascii?Q?kDRPHDEa3CZdPjHdNx3hw87q/DrX8+Max7wwgOw60DnVXM1fjciigXoXN+tT?=
 =?us-ascii?Q?aT7f7COsRfSwxroD+1PbYv5eIBgcGDDtKyIgoGRxx73dhrougGCgKwwa9wvo?=
 =?us-ascii?Q?aV4KSLLEyyDuHeHwHxbPp2nf8ZmbiNbBN7nVRBXyS0BCisHACATEgXgd+UkG?=
 =?us-ascii?Q?tMGS6WbPUKw0soIYmrkN+frGXCmhgc1UcYoa1Gd5/REr5R9d1JbL44GXQniz?=
 =?us-ascii?Q?1i3vWIKm5UTUw1t0n7S6RbcJ+Zr6q9PKO7+mOo8C1+naN9Y24aD7c457qN8Y?=
 =?us-ascii?Q?BvIPpg8HYBMgiMZ91y916j9rmnMVVUCapkK8x9gZaaEfT5bnhRpHCjH3SFEM?=
 =?us-ascii?Q?HhRjJiMn2q3fqUP217mBuxFLgux4s3Cwhu4+Ju9CHiP6HfWesgE9hUGej1Nc?=
 =?us-ascii?Q?bNRFSx0pP15rDsQ3mc4B1WS44mfpQ4/Ca3pUVtRZ9K/+fx/H6eSgj+JO+fqA?=
 =?us-ascii?Q?GvbBLwpA04bDRHKKSZpDHehlUODMSXYrsY6qhDkPjfLDcYzhLgclWtPJPPlZ?=
 =?us-ascii?Q?341DecsTYS3URFN6zR7+zWvksNRAF6+430Uiaanz3MhLEB1bLlLPsWTpPNg3?=
 =?us-ascii?Q?dizOB5DNYUFBUn3+F/KiZwsrIQmOob1U/CdFqoRzPnwA+2GL1ygYnsw1VgQT?=
 =?us-ascii?Q?pMORGPi1lytimQLr5D6LMZnD6BLjH+EGgmo2I9zBZROgMUIyaGHy3cojNIFD?=
 =?us-ascii?Q?cxzc49BIhI3Lu9veoWrqGow32aC64I/1rEBY7JmopCdq1uvSRuPVcVHw/Ybm?=
 =?us-ascii?Q?xtHlpUvhjUAZeam4Ab3lvNCIpvrvo6lhd1zaRz7xhe2lHieqiB6hG0zrsHCz?=
 =?us-ascii?Q?699H6l+Yu7a003t8n12umjZr8ErPXXyxqZWmuvrGP+eQIx+FJYJ6b+Qm+Ny/?=
 =?us-ascii?Q?FKmphh4kHReDFzahpWSBumjHMRpRv9zy7Yl9MORvrIJlZMuVHiWo08EFFZLl?=
 =?us-ascii?Q?HIo6bw5LHlB/++3ROKL1jFo6OfmlKFe98RAy/Zfq/9LqVZdB5DnfZuNjDeHp?=
 =?us-ascii?Q?Q11jPrSgL6NVzhi4BZufxWznekoIHFSCN1/DR69keLojGYLjsIacb9LxpnAk?=
 =?us-ascii?Q?qpj6nH1p9FVBqqTH+msMqjd3rnBvZ8fdu973Mj3Kw4NjZTXbyXrYX/bdhFOd?=
 =?us-ascii?Q?PQVdxSkyG8Z92GkRfoENlOQm1qODDh0kxoh6v35QM4GsQAs7lqcYiOryOqvF?=
 =?us-ascii?Q?1IPC4TlJ29/3ZHwwnEp/1eVOzakAzEiXhrdk+vSWeSWsU0YVQRtzwCTqF4Mq?=
 =?us-ascii?Q?rCgO2S5RHc7FtKd4mp1UjlUniMPIIlKCixhQAPnc6pmwvCbSWXPHda9yWFqy?=
 =?us-ascii?Q?9YoxFa92J0wWxa76R/uC/kxGcuLo7lwHAzwBYTMnU2u3O85PsWPxjgi2QqNT?=
 =?us-ascii?Q?ezYWGYJK0Ybby3aurJl+HZudEjA3XIDmmR0YAL1eEDx5nVeAWOVsCoCM0FT3?=
 =?us-ascii?Q?8OgXAMBMvoIVw4sfYvJ2sLKy5jMKKFL/NRiuuE8Z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d45ee4d8-70a8-4a78-697f-08dc73b3c314
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 01:18:28.8596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p4VA6bneEtwYHX0ukXQ3s1I9kscNxNs5cQv0tSYjDBNRwORdGH+UojmD5oCqQVf54F3+e3Nd8qE4uWE4Bzx/cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8664
X-OriginatorOrg: intel.com

not_report

Similar as previous ones, this is a renaming patch. The include lines are a=
lready there before this patch.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, May 14, 2024 08:53
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [arnd-asm-generic:syscall-tbl-6.9 45/46] arch/arm64/kernel/sys.c: =
asm/syscall_table_64.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arch@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.gi=
t syscall-tbl-6.9
head:   e0d7a2fe9b74052a280531e773ebaba59e2d523f
commit: 56921b57d82d74e6e7433932f8b33a52ca7e6977 [45/46] arm64: rework comp=
at syscall macros
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15=
a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405140838.gXq6QcpD-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/sys.c: asm/syscall_table_64.h is included more than on=
ce.
--
>> arch/arm64/include/asm/seccomp.h: asm/unistd_compat_32.h is included mor=
e than once.
--
>> arch/arm64/kernel/sys32.c: asm/syscall_table_32.h is included more than =
once.

vim +55 arch/arm64/kernel/sys.c

    52=09
    53	#undef __SYSCALL
    54	#define __SYSCALL(nr, sym)	asmlinkage long __arm64_##sym(const struc=
t pt_regs *);
  > 55	#include <asm/syscall_table_64.h>
    56=09
    57	#undef __SYSCALL
    58	#define __SYSCALL(nr, sym)	[nr] =3D __arm64_##sym,
    59=09
    60	const syscall_fn_t sys_call_table[__NR_syscalls] =3D {
    61		[0 ... __NR_syscalls - 1] =3D __arm64_sys_ni_syscall,
  > 62	#include <asm/syscall_table_64.h>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

