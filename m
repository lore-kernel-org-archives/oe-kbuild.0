Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD901DFE12;
	Wed,  7 May 2025 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610327; cv=fail; b=s2RfKdbPKqSwg25Gaq/FOFf54A2cCxdQ9U9y1AlYR8HSuVQQTHEJeMMjBwrvcnZ4V21LLu/dvsbvsZVuMpp9hBf1hXSXfomLLJXprfKGnZOTb3LI4asLoVJGfNBytbKdFyguZetyTI7xO4tIGAa2Wyz2BBBTj6xZnAAXUCi+FXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610327; c=relaxed/simple;
	bh=lvZuvqiVW+78aVEqYQCzuCi99IDVSUfKuxHM9A41S7Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BOA5AtE1N+TNT2brokMCY/HjwVjzviXpMYrrhJ6xT3SILTUToYMN9pE8iyZqCTIR7p1unIipbfg1qEz0qUBVElGGcRuF1k4CY33LK4io0+F1pLXI3V8bw0UB4/VO62nfE9/2GjqFEz7SQtVQC9W06RrPTXozm1LU2kSrToVLl44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wlrdiLX+; arc=fail smtp.client-ip=40.107.223.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wlrdiLX+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeAK+nKzHcd/lv2tY384EuOg7/bJloXi7rQCRr6oNOOJNlNS/8Nunyc+BKQmCPBV+DfvpjzG9g81QBLZZ1HHPjYqQyZiBGyNCN2HUygj8MbJ3olcYqXO9bh6VWh1zuK0SFDeGIOteh/4mZXT9z+HgyT2+MYpTZZFd0YZK+fsd4zajg0wTUo7qUikknGTH99+EOEdAlMJdb+sSP/IcxFouqFMhlhxne2ABHS12uzmcoxbYikBVKnr3SyN+bawm09jIkHKtu8EPQQ0gJda/jQUPnW0hm4mtVNIL/did0P79jfD2NWaN4VPn9Ymq0xTr2JioussYcAqVX53REzO7X6dFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZ6lQLoce2exsg0FPyWwyRf07oUnEwQMDfBmoCEkdfY=;
 b=TrAgzTIHf+Se7PZkXT/JEB4B5AvdX3wn8kQujBcWGz8FOs5Vr1LobqQMnvKX9QCxKqxbcMqL2Hkl8vlHlJWd2Z5MQyZDLZCB9G6VNPDjfKDNrViBrC+xUkw7mQ8AQq92/Bj/PRGa8Ks/xmj1SJ9a0TMXQkm1WBnHFZYlGJg6ZeHFG0/IAUOMexfUFn3FMlwbjxyC82TM3j/t0nsFrmbwHfVDUnx74I0eaq/oW4fbVlUraK1w8Uge67iqE4sjGf7Po+lx3lEjMM8RkVKvVwoAAHQ3ratMcrtCxjJ/qEHcseeRx6269pi/7nBGH6QsRVCmC4dEa5Wwrcn+x1jAWRO9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZ6lQLoce2exsg0FPyWwyRf07oUnEwQMDfBmoCEkdfY=;
 b=wlrdiLX+89HM3jYLXU/NnMdv1MWhwY4OYqxUECiPhfI+Sp9QOfcw3M/cgmjw1dyAvquy+vPo8ewQsHXS3jh63XYESgIBKdLYnBkG2WdKy3pKbsxzMO+lptP2lApHYN+vE+wyTJauHHiGKz8dKgdmhNLboDpLhEgZlTfMMMB9O0I=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by PH7PR12MB6810.namprd12.prod.outlook.com (2603:10b6:510:1b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 7 May
 2025 09:31:55 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 09:31:54 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
CC: "lkp@intel.com" <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "Pelloux-Prayer, Pierre-Eric"
	<Pierre-eric.Pelloux-prayer@amd.com>
Subject: RE: [linux-next:master 1785/8679]
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:6992 gfx_v11_ip_dump() warn: if
 statement not indented
Thread-Topic: [linux-next:master 1785/8679]
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:6992 gfx_v11_ip_dump() warn: if
 statement not indented
Thread-Index: AQHbvyzX/ukFhZN6WEiiR6+A/PFafbPG5mpw
Date: Wed, 7 May 2025 09:31:54 +0000
Message-ID:
 <BL1PR12MB5753CDC1B13647360AA21D319388A@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <202505071619.7sHTLpNg-lkp@intel.com>
In-Reply-To: <202505071619.7sHTLpNg-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=950835e8-572a-4038-a905-320a765456b0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-07T09:28:25Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|PH7PR12MB6810:EE_
x-ms-office365-filtering-correlation-id: 0422aa10-2b25-4848-ccc7-08dd8d4a016c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?lyeXLDhEEuRQcaQCIns92VYNfOygNoMA2zGDfEkDLurj4ab7SYrqtU8U3Nuc?=
 =?us-ascii?Q?VWwRD60XlD0tPVRxxdbKol/UQSq1XnQgcX0lB2g/PEqOzDo4Xo5QphmtXJ9q?=
 =?us-ascii?Q?ykJUn+7Tb5pZvIQTJA3ENL3WnUmC3Zl0LwDKO62zM8i7zgukqHoaCSpP3+4p?=
 =?us-ascii?Q?JsZmipUfwQkeTiU/Qt4oInqT/MU/7p8bg+roVMCqlAMfX4NfwARGY4huk1R+?=
 =?us-ascii?Q?jlloDYBkMVz27Br1z1rN1PeEMe9yYG75QcGPccW6ZU6QP+ygTNe+docsczgC?=
 =?us-ascii?Q?sZIkCA02wEv3U2cCKoUjvLRYPfZS5eFIeEo6i6wP7jVqxIHCk+MFmXPEi29w?=
 =?us-ascii?Q?PJz+UxcV0JdYG4klpcAjlvAPHdTnU1BUAP803w62zWjL2j0S2wTv8XXvUD/A?=
 =?us-ascii?Q?BAw9yy2rOvn3BGOmaO3MWRlJIalpTybt/WErxlz+Bs6KGKZJNwhmt6mt6XXG?=
 =?us-ascii?Q?VK7onfzotu6Or6h7huiTBYwMs5sjETzYeE7Nwr3727dKZg4Ed2dKKq0Ccd/5?=
 =?us-ascii?Q?eungUUCgsmGaAjMzcMG6s6sAX3haSD1oT6dB1sF9mb/vqlKugTR+0d1xPVyU?=
 =?us-ascii?Q?3dxFU3XBfgSIA9a6IUufQolTPnSVkPCiRBxVtmchqsbGUcQCaK0kmtNoN+Z6?=
 =?us-ascii?Q?M0TsuLEGZKZUIgka+C17jmXRe8PmBrPpP2vjSCgYjv4DBb2PjtQF7ox+bTT2?=
 =?us-ascii?Q?FcwUZYRyIoiRKlx6ucz03eg50AaSozLR2DTNa4xg6QVyhTnzUF6TQhQYjy+Y?=
 =?us-ascii?Q?A81W3KhaxtVAZNol9LqIPUmrMkUAPUpfAbPlqEvqJf2TLSq/2Etdoa3DZWxc?=
 =?us-ascii?Q?Iy9A+wyhEbXFDip3Feni2icVJAjjclRqPGLwHKlD7ZhHWlZpHeB8+rU0oPpE?=
 =?us-ascii?Q?a2K/KVSK1MtxxGV1uNi/lRIZPAmw3Vm6edRx6P2DObquMaOOvewUeJsWyadW?=
 =?us-ascii?Q?gwjaS5UIR4WkgSc5Ey6d7xvuWLOf2ApLP4M4KDbkradVLeJHpKIcJq2Q/944?=
 =?us-ascii?Q?6e77o938lJqEBxeszIS0VVGIm5KUcULBu923/mjk369PECS9vHrVvdQHHH3e?=
 =?us-ascii?Q?POCOfhEeCdX1Jh/9A+3CMgYCkv6SLWOnwjgRAick+Uh0pUwUvqjjw7W+EMMy?=
 =?us-ascii?Q?6EYY/gX/2VLEspX/ZWsMB56icNP4V5/IDcNFCkWNYns+NoaK84+9yeOQ8rO1?=
 =?us-ascii?Q?iJ6OrDd0kyqfFSFy2jxj+50aOhGPTjuPfQ0lQqeOQRuqNQBne3dFyDxMTeBH?=
 =?us-ascii?Q?appjlj5NDNzoPA/4XKzu0Cu16hMlba4v/3s4z2I4t1f2tTEeUAtA72o8NVG1?=
 =?us-ascii?Q?fi4BfLkAJXsNdZnONIsfoEZif0TRhd5/Z3+5LyBaTLVX3s1QdTTvpoR18Dli?=
 =?us-ascii?Q?v+hZAkmknqP/pBnIKBWf/Cz4GJihL7zsgCTtpSgqUeG5rD1DeXZOBGoovF3h?=
 =?us-ascii?Q?3bO15rQF7hSx6h9lLkBTtyipYWvJNdlA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5753.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ahkfGOt77UogR1wXSS1OW1MHkAS8UfXVaspBXCVjzcDYqqCEkiBYej1xU0KH?=
 =?us-ascii?Q?wT5hKHGn187UOI24eL6ths2SuyjNr7FPWosvrdQsYaijyh4hK32P688fj5oR?=
 =?us-ascii?Q?Jau6pwpfUwWyvW54P30u0w+c3rtZqXmH198IQmDvMTL+OcjcAqGwI902B1co?=
 =?us-ascii?Q?uZXxOMvxE1vc1XrvXDPOcRCp5uYjlBThmW7d+w9IwZKeLeIXPtceKFg+u6Q5?=
 =?us-ascii?Q?dmxEfbnIPbNO8txv0CtFxZwhI8HBXh8TRF13WVhSI6UcKe5U4GqkM0c+cm6C?=
 =?us-ascii?Q?dRv7zHQg59j+R0nhlVF1rMrOX/IgYLShniFkRNjTRgjdDjEvD8Bezv2h8gVu?=
 =?us-ascii?Q?1MxyHQVnrcBJ9d4hHoNhk3VGgE8FHyR4pFtvs5j2TuMARlNr7gMjawjHBVWT?=
 =?us-ascii?Q?gCIQ81DlAkN7d9XvfSiF2418epWJd9+6GWO6vk6wExU2/B9ZlFF9AQHusJWO?=
 =?us-ascii?Q?j7NlGRmF4FPT6RN8VgUN65Gz2OTQ7+zwtERIPt/4U17dZOSvbqEP4NFWi6Zd?=
 =?us-ascii?Q?sP9Q8EGMjKrHdoOVZfVRRw7Ysyk0d6h/40xdKUCVuMh6MRj/l3NaWhP+k853?=
 =?us-ascii?Q?kBgafAt7GXRZDiNsVwHGSNWQ2VC4JxbwA1tKr7itaqctdP71S6fGPRp4yG5P?=
 =?us-ascii?Q?SIuMvKdg0S+yeRumQPR8ezJ+yxGwbjdMtisVx906O41iklBtW/WqqahRnLJG?=
 =?us-ascii?Q?hsBoxfLy27bfbRSB68Q/fgeY+DstWZMy/F2VZp6X9OskaEwUrfs+5/a/nauF?=
 =?us-ascii?Q?Xo5fav8UXL0UkAH9kTqHDMjZ9bPTnOvA3oKNdChg/Esp25W+3ok0Um43Q7Hr?=
 =?us-ascii?Q?phOQ10cMLOaCtb1p6oCnKXlyDqUtuYxWMB8uoFUoXwHlRu/x5f0f+XiI7yF8?=
 =?us-ascii?Q?mgCIqbzv/s4YKTdH48bWo9Xl4HF/VSDKfR71DUn87yzwTUphago3NA73f+4z?=
 =?us-ascii?Q?AXwmKC8Q8UMgOLihkncP7d/xpZqRqYOAd6YLS1iy7EID8CIvaXQpJfA7gt7V?=
 =?us-ascii?Q?jStMVRwLI30uEbH1OebSC25i7V/e9j6jpNSR5fMRE8mGscpxhl6g4rIclfnP?=
 =?us-ascii?Q?XM39EQnNz2LtuqLajp9rrbEjzxmqcMd8zgqoTwh+lnXltrETQgSkSuMrlUKT?=
 =?us-ascii?Q?EeqzDXtA0T0CSWGglYRRyp1XiMtgBvO2m/D+mmex9CFKy09SSOPegKnaQ2CS?=
 =?us-ascii?Q?pWsKwHish6cZ0isa39VHHnVJDLbFPeLOwPc9l9BICuf66L9pFtpOpQOuuX1A?=
 =?us-ascii?Q?b+QYA66zi3601B0F2xiVBbGIxIkJ0mwSwA7392Fj5sHVnxVVSTE+YH0uVsd2?=
 =?us-ascii?Q?z3T/cHGCrLJpU9C2DVVzqPibm8gDudJhvoWA1Yc4s9fyweJdq2EYT2gGbtxe?=
 =?us-ascii?Q?AW9v8ZDtXeqZwGjKbu1vmd8f0xaVXRNjiaEA6onm41YTGV32JXf8TTJ5p4tc?=
 =?us-ascii?Q?V2u67ayhYdheRmC/yQbOZnijfawehbMZ/ip/O3jRPX6rdKIu8BwlnZtOo6Xh?=
 =?us-ascii?Q?qGN7X269io6/CpxarJBnPRat8HOYzuwSioifBmCG3Ew1nt3P0+MJVM7xwXCb?=
 =?us-ascii?Q?vS74zhP9oaCoTkBkF9k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0422aa10-2b25-4848-ccc7-08dd8d4a016c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 09:31:54.7146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fr44tXxFXYmY+ylNpe3NSDAkrFktDzk1APsgMgY1aDNjHJQBMktLd/vuJk5UBSDZT64K835CmkfoXdbsTNmijw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6810

[AMD Official Use Only - AMD Internal Distribution Only]

Thanks for reporting. Sent patch for review.

-----Original Message-----
From: Dan Carpenter <dan.carpenter@linaro.org>
Sent: Wednesday, May 7, 2025 2:19 PM
To: oe-kbuild@lists.linux.dev; Deucher, Alexander <Alexander.Deucher@amd.co=
m>
Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; Pelloux-Prayer, Pierre-Er=
ic <Pierre-eric.Pelloux-prayer@amd.com>; Khatri, Sunil <Sunil.Khatri@amd.co=
m>
Subject: [linux-next:master 1785/8679] drivers/gpu/drm/amd/amdgpu/gfx_v11_0=
.c:6992 gfx_v11_ip_dump() warn: if statement not indented

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: eb15a5d1aef59d1ec3aafe9d9f13953deb9977b6 [1785/8679] drm/amdgpu/gfx=
11: dump full CP packet header FIFOs
config: x86_64-randconfig-161-20250410 (https://download.01.org/0day-ci/arc=
hive/20250507/202505071619.7sHTLpNg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505071619.7sHTLpNg-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:6992 gfx_v11_ip_dump() warn: if stat=
ement not indented

vim +6992 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c

fa73462dc04826 Sunil Khatri 2024-09-24  6965  static void gfx_v11_ip_dump(s=
truct amdgpu_ip_block *ip_block)
b5812822d9c982 Sunil Khatri 2024-05-15  6966  {
fa73462dc04826 Sunil Khatri 2024-09-24  6967    struct amdgpu_device *adev =
=3D ip_block->adev;
368c33ac8ab984 Sunil Khatri 2024-05-22  6968    uint32_t i, j, k, reg, inde=
x =3D 0;
b5812822d9c982 Sunil Khatri 2024-05-15  6969    uint32_t reg_count =3D ARRA=
Y_SIZE(gc_reg_list_11_0);
b5812822d9c982 Sunil Khatri 2024-05-15  6970
b5812822d9c982 Sunil Khatri 2024-05-15  6971    if (!adev->gfx.ip_dump_core=
)
b5812822d9c982 Sunil Khatri 2024-05-15  6972            return;
b5812822d9c982 Sunil Khatri 2024-05-15  6973
b5812822d9c982 Sunil Khatri 2024-05-15  6974    amdgpu_gfx_off_ctrl(adev, f=
alse);
b5812822d9c982 Sunil Khatri 2024-05-15  6975    for (i =3D 0; i < reg_count=
; i++)
b5812822d9c982 Sunil Khatri 2024-05-15  6976            adev->gfx.ip_dump_c=
ore[i] =3D RREG32(SOC15_REG_ENTRY_OFFSET(gc_reg_list_11_0[i]));
b5812822d9c982 Sunil Khatri 2024-05-15  6977    amdgpu_gfx_off_ctrl(adev, t=
rue);
368c33ac8ab984 Sunil Khatri 2024-05-22  6978
368c33ac8ab984 Sunil Khatri 2024-05-22  6979    /* dump compute queue regis=
ters for all instances */
33837d62a4cb5e Sunil Khatri 2024-05-31  6980    if (!adev->gfx.ip_dump_comp=
ute_queues)
368c33ac8ab984 Sunil Khatri 2024-05-22  6981            return;
368c33ac8ab984 Sunil Khatri 2024-05-22  6982
368c33ac8ab984 Sunil Khatri 2024-05-22  6983    reg_count =3D ARRAY_SIZE(gc=
_cp_reg_list_11);
368c33ac8ab984 Sunil Khatri 2024-05-22  6984    amdgpu_gfx_off_ctrl(adev, f=
alse);
368c33ac8ab984 Sunil Khatri 2024-05-22  6985    mutex_lock(&adev->srbm_mute=
x);
368c33ac8ab984 Sunil Khatri 2024-05-22  6986    for (i =3D 0; i < adev->gfx=
.mec.num_mec; i++) {
368c33ac8ab984 Sunil Khatri 2024-05-22  6987            for (j =3D 0; j < a=
dev->gfx.mec.num_pipe_per_mec; j++) {
368c33ac8ab984 Sunil Khatri 2024-05-22  6988                    for (k =3D =
0; k < adev->gfx.mec.num_queue_per_pipe; k++) {
368c33ac8ab984 Sunil Khatri 2024-05-22  6989                            /* =
ME0 is for GFX so start from 1 for CP */
a85cc86cce4183 Sunil Khatri 2024-07-09  6990                            soc=
21_grbm_select(adev, adev->gfx.me.num_me + i, j, k, 0);
368c33ac8ab984 Sunil Khatri 2024-05-22  6991                            for=
 (reg =3D 0; reg < reg_count; reg++) {
eb15a5d1aef59d Alex Deucher 2025-03-20 @6992                               =
     if (i && gc_cp_reg_list_11[reg].reg_offset =3D=3D regCP_MEC_ME1_HEADER=
_DUMP)
eb15a5d1aef59d Alex Deucher 2025-03-20  6993                               =
     adev->gfx.ip_dump_compute_queues[index + reg] =3D
eb15a5d1aef59d Alex Deucher 2025-03-20  6994                               =
             RREG32(SOC15_REG_OFFSET(GC, 0, regCP_MEC_ME2_HEADER_DUMP));

It should be indented another tab.

eb15a5d1aef59d Alex Deucher 2025-03-20  6995                               =
     else
33837d62a4cb5e Sunil Khatri 2024-05-31  6996                               =
             adev->gfx.ip_dump_compute_queues[index + reg] =3D
368c33ac8ab984 Sunil Khatri 2024-05-22  6997                               =
                     RREG32(SOC15_REG_ENTRY_OFFSET(
368c33ac8ab984 Sunil Khatri 2024-05-22  6998                               =
                                    gc_cp_reg_list_11[reg]));
368c33ac8ab984 Sunil Khatri 2024-05-22  6999                            }
368c33ac8ab984 Sunil Khatri 2024-05-22  7000                            ind=
ex +=3D reg_count;
368c33ac8ab984 Sunil Khatri 2024-05-22  7001                    }
368c33ac8ab984 Sunil Khatri 2024-05-22  7002            }
368c33ac8ab984 Sunil Khatri 2024-05-22  7003    }
368c33ac8ab984 Sunil Khatri 2024-05-22  7004    soc21_grbm_select(adev, 0, =
0, 0, 0);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

