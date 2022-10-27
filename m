Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A96D501;
	Thu, 27 Oct 2022 18:01:53 +0000 (UTC)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RCR5ZS023707;
	Thu, 27 Oct 2022 11:01:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-id :
 content-type : content-transfer-encoding : mime-version; s=s2048-2021-q4;
 bh=/706J+uqMKkMdTjFYCezjvNFZ+vA6sxpEG6Gw+VM8Gw=;
 b=DdmfokPkeZLPRPsIoqxhBxuWtfAY+X++5b1tTFEND6jONEa9vl+lit9GNuKQzhMrXH/7
 F+sG00nXMlPEjF/hPZ9q+teBCHwzeU0kSdLDPmWBQesIIroLwdN0KqBNtsS6PiabhEi4
 XOfcrbOg1tukqhmCobq+IJOieGQeJbXamRxcj4aBciqnTNVqLfxGG+AG/Gwx6KObjy05
 YG/8pzfa/3zUQlkN+18lcIXo142XHi+aswqO4XMkN2n2uRf7wmNnl5DkGoB1LaU1Fx+z
 gwrscYPd9q2haYB+WbPsUnz3YjTJirLuuK84PUHMlH2xsl3NQN8IR2/TSZYq9fueJugT Qw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3kfaj5upgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Oct 2022 11:01:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaujL2BQI41UJlbUL0IeDGSpfS0/AeP53H/EcYJx+696kzXtrq+9JAkIAT4fnwvyXvgwR6ae9Wlv/oj51wzyuQFR9js0KCQCgkLVmDGjaI7uf90g+ZTCok7deMDYfOcQ4yPdYl7x9XacnRzuI1NB0GlCMJL1qUJgwPIwLTAuHaZE77Jb/tMXSYesqlTMt/w07QfGfIAB1Zjbm2a5u2q1uqgC7PJyJpsKxOuLknTFOGofsfLroqpLwn8axbaGo3jyTW3l25r5BK1xibwWiNM3VzESheOvcA5daqKvcfAwo3MGeHQp/xravZlDJcHkLIda30+dPdTCNJVCq88BHvn/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRx4PH50n4WmahPYjGf8pvFSotL/WQEzXtNIamLAZ5A=;
 b=V+xm+A5R8NZeKlelQbCoIVXbeNwcCGEOONz6Hbt8FK7OqwDce42fDXbimt9hk0EatgxVKp4JpYezBmyzO98orak2bsg3E3LcP+t1n5QNrf/aE2jFXkpiTuckDuE+QNUEDpk75v/uTa1KIvxYWQ3vaURaFxCMW00MTUXZ4MeB4K6IEAVxrw6E+rHrZ3aYioqfQUtWWCxOAV1sdcWis9oojDxECVeN2z7YPIYSK4AZyMk+QOegAtSPhHlPPZrRUES8BGGlVYf38pgByiracDXa2OpsdqgsiRd2NdteCSLzIdU3Rq8vP8A3q2LCBCUS5XbDtAWIJ1g9yMkwZ16PavkdfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by SA0PR15MB3805.namprd15.prod.outlook.com (2603:10b6:806:8d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 18:01:39 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::e984:e908:9944:5068]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::e984:e908:9944:5068%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 18:01:39 +0000
From: Nick Terrell <terrelln@meta.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
        kernel test robot
	<lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>,
        Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [linux-next:master 2780/3509]
 lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the
 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need parens
Thread-Topic: [linux-next:master 2780/3509]
 lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the
 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need parens
Thread-Index: AQHY6doTzC85Mhcw/0+rQq/HgFNj764iiJ0A
Date: Thu, 27 Oct 2022 18:01:39 +0000
Message-ID: <E1803894-535D-462D-9760-01E9A5216A20@fb.com>
References: <202210262313.LLXfFkhS-lkp@intel.com>
In-Reply-To: <202210262313.LLXfFkhS-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR15MB3667:EE_|SA0PR15MB3805:EE_
x-ms-office365-filtering-correlation-id: dd608670-4215-44bd-5f1c-08dab8454bf3
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3UKeffWzuDtQGV6Ny6wHRXB6fRDLD2W3cjo6ZzKA/9L3jLmmef1SgSrofdPf4EaNXcuXyY7vWYMPKnhe51UVH1f3jNjBcMZnnvEaKX8WFWWxod16kjAbVlG5UF+tNWglQU1+LAHBKpRBmnCdjZGRVNEL8IxQIikISlICCYzk+VHR7LXhcZ9Ad3Ycz20zZmiz28br8yhKHwQNw4mB79/f4/4mZQe+h4VVoFl/9twss38LEYMQ4dkzxEti71a7kI/CS0CXaSTst55OW7F7dlT6vmrBwwXeGPiI50AZ/5Qg9NCKvUL/ac/Nnnti+qmtofTz6x4go8faJ8/LMcT4i3Ufis/Aqv15ouEVjN0s4pWXPhcDe6vdPyj6JoVugKZQnM4dhnSViGAgVc+3c8AzsWJMnxtVAutcnVFoWS2XhbAgX7wFjEoELzSQX68k6UegxW9nwWXPsV5Y/PyNqdP4Nc7eaZ7kqxCiKuieIq3HwgBVa+zhIi1t+UMzIMGSBSX8OzOug0ctuRtPqbeVHrr9NOSOvXDspHsRcMMqAMSloxESRO1Q3fosaPWWFnFGEWH4ocsjF6NWyuHrRmMNIw+SSdE1UGKq8odSR4jKCA9PsL/M1542M3HOanahwPFsgX3IdLy89YqSnLyOp196F9BagmE06s2Vx2jGuA7XNo2U2aVxvAsf3hMUaRXWMoEDkHYz0CV0c+WYQ59AA8PMXDXjlfWMZFJ5SHUEEtD9fy/J09lh9KnLuAl90xkcVW1xoCeTfJZiTviNJWo4/itcoreI3B+920Vned3MYwjDdPYF/f+JpXc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199015)(6506007)(9686003)(186003)(6512007)(8676002)(83380400001)(53546011)(4001150100001)(2906002)(5660300002)(8936002)(966005)(6916009)(54906003)(66946007)(66556008)(76116006)(64756008)(316002)(71200400001)(41300700001)(66476007)(6486002)(478600001)(66446008)(4326008)(33656002)(36756003)(86362001)(122000001)(38100700002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XR9s7XRJRfo2nMW54eufHWNkmQ+tR5zD8CokDIxwzQAYg0EiHEeHOVT3JvH/?=
 =?us-ascii?Q?otmCrI5VEFvFFaZ18lEriPcfjf5pMcSa8mV63hky2d1NsLyCHzOLj+TPj19m?=
 =?us-ascii?Q?2CWMKIiin4D+bm/y/69VVKNjApIVfx57YkHsWsLRylxxukJBtVktOM3gcKAQ?=
 =?us-ascii?Q?AZ219iOwLq7ArVRP8u83RZoCun1iwZV/uEK+zUGYbiZWENazrApVyD5qp5an?=
 =?us-ascii?Q?N5C5vTaPVKTBBsMpoLb3JABe1kZWaqRSHJZutr/nNU+Xi4VgFhvJMSAzKVpH?=
 =?us-ascii?Q?PoEhoP6or6eqDINKxcK5pGlP8AIlqyAqEPhCDSQsS00AqaUgjptOZossbJMc?=
 =?us-ascii?Q?0EW2wSCnPbjjxvMNR+oEqWYqtMR70RYJWrvX4suESjHUrDSzrWkGpXgY5nDq?=
 =?us-ascii?Q?ONJfTa/lDoVkFHzh62SSUbDxPuSeRjJSI+iLyWemHwPh06Ns/BcWutBpZKnk?=
 =?us-ascii?Q?Ua5wgTyRlQlYABqpi/KMqkoukJFcDqT5O+m0di190SDXP4nnRDTVNj8k7w1r?=
 =?us-ascii?Q?iUufIQmuOdqJcoXOKkLyln+IiAFp5gh9bXrgrE1BsDdDG/MkkLob0t1To/k9?=
 =?us-ascii?Q?arV/U9BkPyFMILa4fdieSZdhvUd6hQmNzh6z/XlEdU+VKyWCRXS65K6caUQ+?=
 =?us-ascii?Q?vnYEMuTvujWl2YINRFijTW71GxrrqD2gmxNdze6Axg9Qeq6XcDlwy3OfI5wl?=
 =?us-ascii?Q?G3gE0Z/EJLvAG7hoKU2YJo/q0NGhpbAeS1s3xa5z/1A7UzEfKxK5V9yOlxsa?=
 =?us-ascii?Q?vZ6K1DbvrPoYkTgbG4ilhBEoj4JMCKut0a6LOLY4BbPBwdkQ8d1NhncEaqzf?=
 =?us-ascii?Q?+7OjqVUm0hGtUBy9Vj/Cpt8gOj11wJN/9fZ21lW8iFr0Zj0XDavMaAFT7XKA?=
 =?us-ascii?Q?/NJ5WBXGkXeGJeZmpFMA2ampsEm/r2lhYMswXkTH0BXg4Qgv4OI+11/0nnY8?=
 =?us-ascii?Q?tbhu2o6QmJ97a46FzJ36wWDpK5wrP/Vf8hbS+cUbcV3QnNjCHfsevzSHAWn/?=
 =?us-ascii?Q?lmpQf4WrXmRBRL2RPI1jN11ZDUfKUncO0MRcTYNALnzqGDOU4WOJImRDTRJU?=
 =?us-ascii?Q?brni2ZBiqasymH9JQmmsrZ0hMfbT+QFqSX41Pw5ALKKjhgfwcxkp81uDamei?=
 =?us-ascii?Q?+rnHYhtgHCgPk1sv+KscBg4HNk0Mpnie5dzobkvHsdMy/Y53bV2FE7zpzs++?=
 =?us-ascii?Q?fMaYuw51eiJWvwSkzwsDZb70arSOY/C/nzd0Lh4rT0CSUqoNeo/mW9WOOMRm?=
 =?us-ascii?Q?ss7/wPlL9uehXvPraoJfFHElqY9mhuP5li0pgn9gl8g0cDzz0jeMllPyFm/5?=
 =?us-ascii?Q?j3tV8K97dw/qecT5hrxDJXNcy3o3eXw2/F3bNO0XZ65QM1Fj3Cjcce8WUu/s?=
 =?us-ascii?Q?QaKZ1ahvKgNF9iweJ5GZ9V9LgfCOpWhxjOyruRNDwmW/aMSgQMABI36jo6VO?=
 =?us-ascii?Q?vrEUc04ikPbzSeCvqmAqgxSAJ38PXyVAHAFeD8F1DslF1dyOqZoyx/bU679J?=
 =?us-ascii?Q?MTuefQxacHS7/3tg1ePNSQDMiBJ1YYxnHfjHGfg/t+nUMuwIGgYV24QZYacc?=
 =?us-ascii?Q?5HfQ5sgR8QmdCgQyYThDNcvFDC5F6ssKEGSGJIjsJx8QZzzFtZR1ZBgHIV2R?=
 =?us-ascii?Q?TKXQh/Lv5lmi0x/c+E6Ysh4=3D?=
Content-ID: <0BF8DE1093BF6B42AD761E60E5412B6C@namprd15.prod.outlook.com>
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd608670-4215-44bd-5f1c-08dab8454bf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2022 18:01:39.2529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLb9VkRE6Sclf4oOqsZ4knpgti34tepd55PWGlmLYmgS2ELyl4vZKfFmd6mFmUd8++7ma3xkP4mnSXN4CVX0LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR15MB3805
X-Proofpoint-GUID: F23tCRg1W076jlH4HhA2C7qot3Mn1Cqh
X-Proofpoint-ORIG-GUID: F23tCRg1W076jlH4HhA2C7qot3Mn1Cqh
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01



> On Oct 27, 2022, at 12:59 AM, Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
>=20
> !-------------------------------------------------------------------|
>  This Message Is From an External Sender
>=20
> |-------------------------------------------------------------------!
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   60eac8672b5b6061ec07499c0f1b79f6d94311ce
> commit: 2aa14b1ab2c41a4fe41efae80d58bb77da91f19f [2780/3509] zstd: import=
 usptream v1.5.2
> config: i386-randconfig-m021
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> smatch warnings:
> lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the 'RANK_POSIT=
ION_LOG_BUCKETS_BEGIN' macro might need parens
> lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the 'RANK_POSIT=
ION_LOG_BUCKETS_BEGIN' macro might need parens
> lib/zstd/decompress/zstd_decompress_internal.h:206 ZSTD_DCtx_get_bmi2() w=
arn: inconsistent indenting
> lib/zstd/decompress/zstd_decompress_block.c:894 ZSTD_execSequenceEnd() wa=
rn: inconsistent indenting
> lib/zstd/decompress/zstd_decompress_block.c:942 ZSTD_execSequenceEndSplit=
LitBuffer() warn: inconsistent indenting
> lib/zstd/decompress/zstd_decompress_block.c:1009 ZSTD_execSequence() warn=
: inconsistent indenting
>=20
> vim +/RANK_POSITION_LOG_BUCKETS_BEGIN +460 lib/zstd/compress/huf_compress=
.c
>=20
> 2aa14b1ab2c41a Nick Terrell 2022-10-17  457  static U32 HUF_getIndex(U32 =
const count) {
> 2aa14b1ab2c41a Nick Terrell 2022-10-17  458      return (count < RANK_POS=
ITION_DISTINCT_COUNT_CUTOFF)
> 2aa14b1ab2c41a Nick Terrell 2022-10-17  459          ? count
> 2aa14b1ab2c41a Nick Terrell 2022-10-17 @460          : BIT_highbit32(coun=
t) + RANK_POSITION_LOG_BUCKETS_BEGIN;
>=20
> These sorts of bugs where we're missing a () around a macro are very
> rare in the kernel so it's a real treat to find one.  :)  It's harmless
> in this case because the math works out the same either way.

Nice catch! Filed an issue upstream [0] to fix that. Will backport the fix =
& add it to the patch series.

Best,
Nick Terrell

[0] https://github.com/facebook/zstd/issues/3301

> 2aa14b1ab2c41a Nick Terrell 2022-10-17  461  }
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://01.org/lkp=20=20
>=20
>=20

