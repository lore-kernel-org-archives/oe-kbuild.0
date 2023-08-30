Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E824EA1
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Aug 2023 01:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693360690; x=1724896690;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=fXhrcyuv2jFZ6z8Pjw969uxYvd02cXxhMJ6HpF/D4aQ=;
  b=HpAUvszkSyRuoPzyaLrbjrXr6xJourr/h2/baU+f1GVR3ioUpyt2j+Tm
   kp4YFhGaTj0yQ8X2Ve2E6PoHA4AON6+3kg6yyUIrfobOlPe8AWu/Ersqb
   Hk4MZa4msJkOgoy6wCbp49KYYWP6lgXXmPHdQba/hutLHpVoJiw40Kh6I
   a+KFCB+SF4g3jV5QvcbKapgxE3IalGZm9zarx9xGblPMouj3jN/g3wsde
   SePiTuZ3cT/5gYn5KIeCqC6mMGnKzX0s9c6pMtAfyZY1LPhmM1/ufjlQo
   g/EgDGZEbhFeeXcerMm/oa4GcXz8tOTY7+uYH0a6Nr2KXz7J2SNapuJvH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441890505"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="441890505"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 18:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="985564593"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="985564593"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2023 18:58:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 18:58:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 18:58:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 18:58:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 18:58:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0YrRvhONiwqYE4Dntr07kQLJzjegsBgVwe8DOSWGwpGbV3XZXcR6+kbjnyh/znavS8I7y+QYq7NyNcVMAjA+0jKo4fqlV2IiYvG3lOGEb1RYQqGoL0FCqj/SUSEodf4+T2Jp3N2bDkH7IKrzXmn3+eijNoPLGLdT1e4Dx9g46SF6kVJugIivQ0xomHMf8Np8zXFg/8BAzqbcJN+ktecyqGcYmjUnONI7ukgYkkPr7vwfkwSoHzgoc+3CO8CRFVQIpKIpcNIjvERB/Fx1ZG38vWAjuOL4wZUS5YJ+IjNJZLUY+hcMch89R+UpwUFmRJKSRjKnpJVS2wQhFW0Jfhi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZAZSjMOBMfmGpiULp7SL4Ke/I6226fItmnJJqlCtyM=;
 b=QF4k1H/FZkSimxaXqQDaBEr+L79snNhgZhiwWUTycKqYobdpwuhha2ty3ziDiq7LVGQ1pNDZJzSkWWYgFbt3f7HRHsqdZvnQjxKEsU0vME+q0Ld/TCEpLemUG8Kr/yTKLgy0HKj2x3Fq7Uy2fH81lB1oDgmvSROTAgbhm6hmRAO0ZO96Jn+2tuPJSn/mNRCbYmKCDEqBEjYqHelAfgG4abK7MOpDQahcFpPxS/AqUq5zbX4pf5yMW/LZNimCTyRnGpEiFGC5zpQqMnprjr69Vp3TXrE1V5WcQ56pWiUFlVanOVr7miUgBGQtv460cNpzHfeeN41R1d0pfaMldnA1BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH0PR11MB8214.namprd11.prod.outlook.com (2603:10b6:610:18e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 01:58:00 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 01:57:59 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [RFC PATCH 5/6] virtio-net: support tx netdim
Thread-Topic: [RFC PATCH 5/6] virtio-net: support tx netdim
Thread-Index: AQHZxY9ACjlLHhsQ+Ue6gA6fdNKwwbACPnhA
Date: Wed, 30 Aug 2023 01:57:59 +0000
Message-ID: <CY5PR11MB63922FEF7FBE27D1FCC8EF88FBE6A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202308030654.2yAeKpbK-lkp@intel.com>
In-Reply-To: <202308030654.2yAeKpbK-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH0PR11MB8214:EE_
x-ms-office365-filtering-correlation-id: d145803c-8036-4c6a-eaa9-08dba8fc89bb
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z066et5OGdklsw5iLVCldNzTcOCtTPCsZiQvM5gA/dRuBNVerJXjUFKWj0MLUDbxGA5zN+woKM/cqBJ7+AezcUS+bDIWXDhbnpcPg1HTT+xgqPja4Bt9159BYWzglk5AsFrKA5+ZENa60eEZEmcAR4yfPwwnCAgveHMpeagAhfzl7rO65vWHbfOk0+yGwCTfUYXO2MaU/tmHszo06HwYG6ywLAssFgFseWsknYNWBQhhOLgUbb/Iqa3TuQTy2C4kqceuEdOYQ23zwvD0dpS9kXd0sxqhTMYPZLFBJdFuUiO+ACbYRnRKm4bN2sQVlI7434G7g/zuywjzcxgYkC6zUUq6SWy+Or7Pmz/gTB0O6XhDp1oEDcUzDIQVrAsbH9Q65Q5w5Z+JTBE/HNZd/MYyajCLO/Y28zimcNFVWn3qm/rD4K823hgajJ2aoqhbaEw+Dfyp6fax4eg+EUF43uI1IWXvyVU3ODzQlsSND+L+nUUXKEMg//eB4+wr0rVEPaFrjNV78VFDHiWw9464oGWXWkLosBvc2WfmhoAdSZ7sF74quuctrukpN912ZCLuwuYPimJVatjiWYnovF0RKUOBlIuVx3Op1Ne/rMgBqt/pzpI261srq6QsnKvcneNxWdRU6bm4DI9PMTOYnNmJVoHVOQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(186009)(1800799009)(451199024)(6506007)(9686003)(7696005)(71200400001)(83380400001)(478600001)(26005)(53546011)(966005)(2906002)(110136005)(66446008)(64756008)(41300700001)(66476007)(316002)(76116006)(66556008)(5660300002)(8676002)(8936002)(52536014)(66946007)(86362001)(33656002)(55016003)(82960400001)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+f/gMiXE2mViOhhcWDULJxWyIEKan8mQEOLTfrM6mJ4kBGOJDYIR1BgHr7SO?=
 =?us-ascii?Q?h2JpgKxKj3XglKbXr4raYsNfQgc880ZTT6vMNyGX4KkvwbpqqIL+1D1vjIbZ?=
 =?us-ascii?Q?aBppI6ctVhadIHK6kI3N2Qx3WVh4PPhqND8oOYhwyHcBoKm3J1hQetjzZsEh?=
 =?us-ascii?Q?ayz3rimrwBLZSYDI+336Nj6sRdGE5uHlTsUOi4QbdDqdUXmAH/Wa2x/hX6Ot?=
 =?us-ascii?Q?muXK2Z0fbp7GOfgiJpDILu3g5oA+G893V5ffUD/rNYDLDgZEeZu4B3G/TB4B?=
 =?us-ascii?Q?Dyau4cUzT6A1vedUfe1XUvspAWiGNdjyyEKNDCeiWK57H1/fFLesKGJdZfPJ?=
 =?us-ascii?Q?tTH1stmqBapOHITzUlN2tJOvyqd1ZMhCzVStz0e2bloMHuke0TxSw+K59hn2?=
 =?us-ascii?Q?6gxvtQssjlTi6t2TJGaCIKTZJsB8TI2FqjtPNpHZ0rpw/IDkfRH+r1KICYsY?=
 =?us-ascii?Q?vTRkAttZxoC26VJcpLCKLRzfQ8UWqV97xBtDHUqPumhWklB/1JNQDj4MBdq9?=
 =?us-ascii?Q?qOp9g5L6enb4tNEk0uCxICq/IVn01+IqxSRAm7ClLsRKcYl4V2fQFAb1AYxF?=
 =?us-ascii?Q?Tb/mTMzO8ASjAsJUnDkIcrcFDeCj41f/N+uC7ic3WWvpf66Pr5nG2dU1sZD3?=
 =?us-ascii?Q?T9yDVUD5UIrx6RNSkESjbjV/gqNk2lUcFsDcP0RESeLY3cFKgLULGGbDVJLG?=
 =?us-ascii?Q?qLIu7agMxoJ3yaWrq9lJ2VbSYzXXWEMbKm8t9PYLmFvVDoQI04fK6Ls2JNVQ?=
 =?us-ascii?Q?TVF/Q2jNxM8WvVGZWfG/d4ppGKXSVZLuLApVRvAoYep4PcVah10sSlNp7XyP?=
 =?us-ascii?Q?mIXhKoO+DDZuLji99DzNT/uvAvJbacZwcDCRLdACDJFEyO5qUJ5KGMo2F7Jw?=
 =?us-ascii?Q?NT8+1+jBauHK9sYBE+O21fRvP5rnn703VdmUC6a9/zribBEHwBNQh2BHApsC?=
 =?us-ascii?Q?m4cNnrrKKZB/YpDqLlHBKTjPNHIbpD/cgFmbPQ1XuoBEG3ZaJBEIXOiea5RE?=
 =?us-ascii?Q?Y+Okuu4gCotBHNYfXw90EN3Yvio2wnuKOm6zCdPgPAF7lu8Q+yLGiVkl41pu?=
 =?us-ascii?Q?PaL54VWZWNB0t249O29aXYeaw1D7Il4WO/o2Gy3OfGOvzbWoG+LGNRcceH2Y?=
 =?us-ascii?Q?7XEkQyaeEJEJuqQPgqTovm1P3ORXVTac1WdmZGHKxft83QgWq5GJEjGUSJxE?=
 =?us-ascii?Q?wcDtTTMESuUElIbOMta+ZXmHVF+VtyALL3BEvXBX9bC5oSfZfrSXa0ZidHdc?=
 =?us-ascii?Q?j5mZIBfEaKxu+d8bz7FAu1JwsEe9+in7IlCDwvphj7GkL9xCMrwnADBrECMu?=
 =?us-ascii?Q?zYglldmRIFfLtZH/Bhs9HWYUqEZfYXC/b47OxuEtQmIhP2sQwixt7SqAQR4R?=
 =?us-ascii?Q?m75A4nipaMZucozUcpMhNVLlZ1kCC4D9LS/tDAnor9+Ify5hdeCaXfuBvLUt?=
 =?us-ascii?Q?iiJ4/lMoXN6zZkKB9r7n4r2E4QsFvvkIfYHaT9JRSi98U0auUnomkocT/Nhc?=
 =?us-ascii?Q?IA6uFncMk1B3+ar2urqAMnaEBcOrs1naxUSDYUTsQNf1lsFYAlF7DrB/DmTq?=
 =?us-ascii?Q?qDj+9ooNQYcmD8/k7f2BNG19O6PYmTZ9vnrvRXSQ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d145803c-8036-4c6a-eaa9-08dba8fc89bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 01:57:59.8686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5vCbtqfCpno0T/+0hn494e9HpNT7E921edZoudXfDPEUphjxIAeTv+5IBu7L1yCPp2OggAtxS8YFRxGrgeLgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8214
X-OriginatorOrg: intel.com

not_report 'outdated'

The patchset in the link should be applied as prerequisite.

---
On top of
https://lore.kernel.org/all/20230731070656.96411-1-gavinl@nvidia.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, August 3, 2023 06:16
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [RFC PATCH 5/6] virtio-net: support tx netdim

::::::=20
:::::: Manual check reason: "git am base is a link in commit message"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230801082235.21634-6-hengqi@linux.alibaba.com>
References: <20230801082235.21634-6-hengqi@linux.alibaba.com>
TO: Heng Qi <hengqi@linux.alibaba.com>

Hi Heng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc4 next-20230802]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heng-Qi/virtio-net-r=
eturns-whether-napi-is-complete/20230801-162552
base:   linus/master
patch link:    https://lore.kernel.org/r/20230801082235.21634-6-hengqi%40li=
nux.alibaba.com
patch subject: [RFC PATCH 5/6] virtio-net: support tx netdim
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230803/=
202308030654.2yAeKpbK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030654.2=
yAeKpbK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308030654.2yAeKpbK-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `virtnet_poll_tx':
   virtio_net.c:(.text+0x932b85): undefined reference to `net_dim'
   ld: vmlinux.o: in function `virtnet_tx_dim_work':
>> virtio_net.c:(.text+0x9335a4): undefined reference to `net_dim_get_tx_mo=
deration'
   ld: vmlinux.o: in function `virtnet_rx_dim_work':
   virtio_net.c:(.text+0x934034): undefined reference to `net_dim_get_rx_mo=
deration'
   ld: vmlinux.o: in function `skb_xmit_done':
   virtio_net.c:(.text+0x9346fa): undefined reference to `net_dim'
   ld: vmlinux.o: in function `virtnet_poll':
   virtio_net.c:(.text+0x93b923): undefined reference to `net_dim'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

