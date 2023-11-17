Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A795E12E56
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Nov 2023 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPGWESpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700209953; x=1731745953;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+AlXSr/tEJM1luxvJ00/SefO4wq7nW2J85TccGvVrT4=;
  b=SPGWESpKk6QQUrXFiHBCkQROT3n8jMxj8kgGDL6xLaCT/GWmGDGhfxt5
   LXZho59tg5dZxepnpJh9qlsNLnMg83b7jTu/+/tC33KXb2SbZ+3+YEKTg
   GtBUnaTQcUQTeuSPdE0jzSdwE/sqH7zMc6wiptpCfzbOXswXWnX0h0WHb
   eyneGFqRNEP5ZHysyailz6zd3/QxMd27qkLDEJaAjIoKns6WYhat4zZVF
   oFeHdVo10kea9r/cxczd4ATvB/HTMksPLCPUmhFfcJffiXFe2l3PwkMuh
   WT6ZjBWPo1s40xTtsI3Tp8EVAJ/2qTTtU9OtLMd/MKuLbCXgV/azw3GKb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="376310082"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="376310082"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 00:32:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="759106804"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="759106804"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Nov 2023 00:32:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 00:32:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 00:32:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 00:32:31 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 00:32:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUwjQc8z8PszJS6QnAHQyvt5nrWFNeBRxJwBzrBsIV/qPrdaOoNnDabFifPY9CQSorelj34mvr+PRsGl3SyK6rsERA8UpAR7h4mGNe9JmlnvEIwmwnEnZCXU30z7MPnAG5kgOEot4RqvT2KqxZ+YOqX+W2spMhb+XPoWZYu4MYqdpX67pEM5ECfvLB/9GDN5GOgmgGf26nDstEpJxUUFTOmMJOdHz74znPnRTHtAPEMkxhhUb7bzDvYh50t59+pyP4RHQKcsjFE/2uXfvwbsYka3vVQTe5vwaxJSOzvt0xq/3vLOfeU0hwc2qC8qbyaDMOJjyw9qSytTV3FCpCqXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4/rrR2AHdFCbaMgZOD/pFJy4D23+XjAvX/+Xwux/bc=;
 b=A1EK9zdBS8I7oqbktbZL8wPVsEpaopHfkALTC59SPlV7dd+DlfNhrghV7hXUGna2TF3YTcwPX4shYgkf30rIihi95xWzkxXORF9c8OMnBserLfBinjc/CiHbl/LZjph9PKilM91bwtGJqQfL7IlV8Plq3i4EtB3XtNZr2eWeVzxp4Lzkicja43tvDoGV1J/fFelu6CHepyvS3VqE1w6mhs22SrnOatS8KTlegXPi9/Q6WXT57F2413O7iNQeBCma5Fao/5QQxd3nVW4F1w9VRKlmWNHbZUUt7lspKDYcJH+NCxUA1Hi1BMcEtUccCp77bucmATfqutGqGiv2oqicqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH8PR11MB8038.namprd11.prod.outlook.com (2603:10b6:510:25e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Fri, 17 Nov
 2023 08:32:24 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.019; Fri, 17 Nov 2023
 08:32:23 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [gustavoars:testing/next20231116-Warray-bounds 4/4]
 security/security.c:810:9: warning: 'memcpy' offset 32 is out of the bounds
 [0, 0]
Thread-Topic: [gustavoars:testing/next20231116-Warray-bounds 4/4]
 security/security.c:810:9: warning: 'memcpy' offset 32 is out of the bounds
 [0, 0]
Thread-Index: AQHaGPO4khaZamkbSkG+lqPnJOLa2LB+LqMg
Date: Fri, 17 Nov 2023 08:32:23 +0000
Message-ID: <CY5PR11MB6392D4D981B48379A0892786FBB7A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311170928.SdIOGhSh-lkp@intel.com>
In-Reply-To: <202311170928.SdIOGhSh-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH8PR11MB8038:EE_
x-ms-office365-filtering-correlation-id: d31004c3-f685-46f1-9dcf-08dbe747b93a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /RhMm3+IaPMWKHSEuwQ3hXd/KmjcFVfgjfLgcg7UWih0C/OZ5No3Gbpcmit0fyxKVAbVSJIlAiJ+1YKT2BY5qRdabVezQJYPjHhGfSotGTGEVvXkItgyeh0txPm+rp2i+wfnv8Xf0dJKbl7kmuov2rw8ANUtd1nzgld56QF3oYYlbWWdALiu63gTsooiUwJSeWl0vltZSVdmRvHsV4cYAIAqKfY51bktSsd4WZgzs5Hlim+iTfObFOIFi/URYanjR5xUYE+diNm60/+fEhlO0vex5OzuLS+hCi+ZQqebP//0ueU3ZPLpiTTieQz/GSvwYUJ+uEn9bXts9jnizXCcs3kSOsNetYbHct3qEMvUvAuguVqeVrOYgyY5vwf6kyBRL4Q+LTuMBrH8zoSNTYSblSHqWLCV4Dw4IkgaCiuKxQ1zPAJw5GkvKvxW9kaRDl636kpCe5Ir8hYpVfF67IOqmIGSQ7FfKYCABV3OYqXf8tPq74zbqMPRuvgh60AVYWpapdq6lTCucsGr1GRdMZKD43k/0W0YF9BBSjzyK2ZPfNuq2q9JAW0i8r8aUwIlOuwSx8RVG3FAp7vNd3IpVzQ6F0V4MP/Oleys2S2f/vpKgel8RCf6DebJOWHQqh90jhcoh4PIIiRA5+/jhmk95N2yc+/03QkZP3fl145+IR1jEnazTomVImh0UNTMQ8kHNxb9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(230922051799003)(230273577357003)(230173577357003)(1800799009)(64100799003)(186009)(451199024)(38070700009)(55016003)(6506007)(9686003)(7696005)(966005)(316002)(52536014)(8676002)(83380400001)(66446008)(71200400001)(53546011)(26005)(478600001)(8936002)(66556008)(64756008)(66946007)(76116006)(110136005)(4001150100001)(15650500001)(66476007)(122000001)(86362001)(33656002)(82960400001)(38100700002)(41300700001)(5660300002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AqIKSiutTkyLYZ44NhP2HX/1azRb4Iz6izQQvgZu8vz7P0zfX5Lg/MOFsR4Z?=
 =?us-ascii?Q?vQj7rKLHaETJh/gELhQ7ffZZwUTzqt2M+MMfawBui5BymxDj6ZyYf3rJv90y?=
 =?us-ascii?Q?RvS2hy4wsB3BlNWA7qWcAMLb6gKwM4IarYKC0I9ot7GgL6LkJSS55nJW9WIh?=
 =?us-ascii?Q?qdoiyodjDIjDY2SpPZGcYcShY8dnUJh/UmCVVAzu5TTO5guG40UMwynPriQr?=
 =?us-ascii?Q?KUT496VKJHfjDJnYa6KeveLzEFTSt2oN67bOA+TQYkQnoyD4Mw35iMfL/0Hz?=
 =?us-ascii?Q?fRVZ7CszDRibLeO5AkuhHtdyx6NhMNtp/HtegEvTfQJrAly96GPoGAuZH0Pj?=
 =?us-ascii?Q?PfmnyvlGkbF4PQAj3K0QDYNGPAJXfrGxez1taXmiiRogjcqzQasjrf+5kuQn?=
 =?us-ascii?Q?TzeZhMU5i6bsSYh7fJdcxia+8HnVarslx6a2ES+0kBsW8BCx4LgLmMRI+PGo?=
 =?us-ascii?Q?b2oKnOAanfvrVKey1epVIiGNeXYg7hv5Xerv6Z6CuoIBOsKU3HubQz1L1RXO?=
 =?us-ascii?Q?shNMqSCrenNhxLiBeXPyBelWellxRc4+PXKGfItCTw/far8LnX2xzK+ryrb7?=
 =?us-ascii?Q?aYJ4esHst/U2oCv977ItZ6TC4fI3+F2fi2zl3M1jdct1OKspFiL+pJZp+Dmm?=
 =?us-ascii?Q?uU3qxdniEvVgNX3MeRAlI+kx+kVgDB9CCzHcbiLzKq/q5I9DoL99vYU9okF1?=
 =?us-ascii?Q?N5ZFPxX5tUGR6WxjEJH2SYSpWRYpmF7PoPffiHXCkLLVmHaTW7PqX7kv1zQM?=
 =?us-ascii?Q?i/4zehhbKZv55+mdvmyd23LGATL1kNSWB9IodSYCqPIqCfK+6DBbxF7AGHJC?=
 =?us-ascii?Q?aYL1lGpEL4TvxZ5mUDsqjs29Bi3QvrHf1P/RJ7dQIUtPnGPJxVKOdIerrgJp?=
 =?us-ascii?Q?yQ0g8FDPeDB4lVDh3A29B7PYj31vTF3XUQ+Qy1/qJeI8DECnmk8wA2ugWmsp?=
 =?us-ascii?Q?XPYTRVD2W29+zuIx1PysLwxruoWZ8LMpcLjstsWfKkPZxuPI5d3ICN6oWee1?=
 =?us-ascii?Q?p7FwHV1WzT5J/LUBTfEb38qytiMIlYRGdJv0HHW5BBUDjZzTLzd1wK51Vqgy?=
 =?us-ascii?Q?AUIJ4LlXWUMyLCnrp7kZxvq2IlHWnbNJHhZVquNcI3z6i8WQ4pwK1YDFd+DH?=
 =?us-ascii?Q?zZjX2t5QtEsy3IiorKdulw2sXSQ4ATTHRsxyUHWUdhHKhDpJFdZpGKAE4Mh+?=
 =?us-ascii?Q?ObssHKSOuZwObyzdLH6ZonNGXzy3BvUiVFNAMIyY/3YBdV0cAGjd9l8e4xvk?=
 =?us-ascii?Q?+XlUYJPt/0el0b13CFt3kxAbcs+AUi8tOnCxZqlarJSHvGz+JpZ5HIngYWT+?=
 =?us-ascii?Q?dlw06A164vjVDxtCBE9G8ltj5YinCwCeLCPkKH7lxyPUrtMm/TjR/KhBclIV?=
 =?us-ascii?Q?LbBDkOAIOICpnkFxiydsx3COBVcJxZzS5qixCd5HxGAPBerCIeSMf8AJlIeZ?=
 =?us-ascii?Q?DTdWUfIRZru+bQCgGVl350wZPY0mSCVcNbNtpCU1m4m1IrZKd3JgzRLchJjm?=
 =?us-ascii?Q?25COcja1nvC7ZxLNh/mlR6GZxXYzh3gwla3FKmjvmJykLsUnVNvuQs1B5sWQ?=
 =?us-ascii?Q?JUFW9XF2HJ2YmGBJJXMEMuuSkEB5HJf8RFySeQAQ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d31004c3-f685-46f1-9dcf-08dbe747b93a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 08:32:23.9078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h8YrG5QXszEz1jcbEpB9ufNl5tc6zLmUN2XmFRGBSlPYdOhCxaLaoY+84Lnty72q9duhvdMqBsjC/NqvkfVaHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8038
X-OriginatorOrg: intel.com

not_report

According to the branch name "gustavoars:testing/next20231116-Warray-bounds=
", this looks like a debug branch.

We already disabled "-Warray-bounds" in kcflags due to some feedback of fal=
se positives from users.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, November 17, 2023 09:15
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [gustavoars:testing/next20231116-Warray-bounds 4/4] security/secur=
ity.c:810:9: warning: 'memcpy' offset 32 is out of the bounds [0, 0]

::::::=20
:::::: Manual check reason: "has Makefile file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.gi=
t testing/next20231116-Warray-bounds
head:   e636d8836f48541eb6e09f4371dbb8869ca1fc1c
commit: e636d8836f48541eb6e09f4371dbb8869ca1fc1c [4/4] Makefile: Enable -Wa=
rray-bounds globally
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231117/=
202311170928.SdIOGhSh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231117/202311170928.SdIOGhSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311170928.SdIOGhSh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/security.c: In function 'lsm_fill_user_ctx':
>> security/security.c:810:9: warning: 'memcpy' offset 32 is out of the bou=
nds [0, 0] [-Warray-bounds]
     810 |         memcpy(nctx->ctx, val, val_len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memcpy +810 security/security.c

1aea7808372eee Casey Schaufler 2021-04-22  772 =20
e1ca7129db2c3b Casey Schaufler 2023-09-12  773  /**
e1ca7129db2c3b Casey Schaufler 2023-09-12  774   * lsm_fill_user_ctx - Fill=
 a user space lsm_ctx structure
d7cf3412a9f6c5 Paul Moore      2023-10-24  775   * @uctx: a userspace LSM c=
ontext to be filled
d7cf3412a9f6c5 Paul Moore      2023-10-24  776   * @uctx_len: available uct=
x size (input), used uctx size (output)
d7cf3412a9f6c5 Paul Moore      2023-10-24  777   * @val: the new LSM contex=
t value
d7cf3412a9f6c5 Paul Moore      2023-10-24  778   * @val_len: the size of th=
e new LSM context value
e1ca7129db2c3b Casey Schaufler 2023-09-12  779   * @id: LSM id
e1ca7129db2c3b Casey Schaufler 2023-09-12  780   * @flags: LSM defined flag=
s
e1ca7129db2c3b Casey Schaufler 2023-09-12  781   *
e1ca7129db2c3b Casey Schaufler 2023-09-12  782   * Fill all of the fields i=
n a userspace lsm_ctx structure.
e1ca7129db2c3b Casey Schaufler 2023-09-12  783   *
d7cf3412a9f6c5 Paul Moore      2023-10-24  784   * Returns 0 on success, -E=
2BIG if userspace buffer is not large enough,
d7cf3412a9f6c5 Paul Moore      2023-10-24  785   * -EFAULT on a copyout err=
or, -ENOMEM if memory can't be allocated.
e1ca7129db2c3b Casey Schaufler 2023-09-12  786   */
d7cf3412a9f6c5 Paul Moore      2023-10-24  787  int lsm_fill_user_ctx(struc=
t lsm_ctx __user *uctx, size_t *uctx_len,
d7cf3412a9f6c5 Paul Moore      2023-10-24  788  		      void *val, size_t v=
al_len,
d7cf3412a9f6c5 Paul Moore      2023-10-24  789  		      u64 id, u64 flags)
e1ca7129db2c3b Casey Schaufler 2023-09-12  790  {
d7cf3412a9f6c5 Paul Moore      2023-10-24  791  	struct lsm_ctx *nctx =3D N=
ULL;
d7cf3412a9f6c5 Paul Moore      2023-10-24  792  	size_t nctx_len;
e1ca7129db2c3b Casey Schaufler 2023-09-12  793  	int rc =3D 0;
e1ca7129db2c3b Casey Schaufler 2023-09-12  794 =20
41793202292fd2 Paul Moore      2023-11-01  795  	nctx_len =3D ALIGN(struct_=
size(nctx, ctx, val_len), sizeof(void *));
d7cf3412a9f6c5 Paul Moore      2023-10-24  796  	if (nctx_len > *uctx_len) =
{
d7cf3412a9f6c5 Paul Moore      2023-10-24  797  		rc =3D -E2BIG;
d7cf3412a9f6c5 Paul Moore      2023-10-24  798  		goto out;
d7cf3412a9f6c5 Paul Moore      2023-10-24  799  	}
e1ca7129db2c3b Casey Schaufler 2023-09-12  800 =20
d7cf3412a9f6c5 Paul Moore      2023-10-24  801  	nctx =3D kzalloc(nctx_len,=
 GFP_KERNEL);
d7cf3412a9f6c5 Paul Moore      2023-10-24  802  	if (nctx =3D=3D NULL) {
d7cf3412a9f6c5 Paul Moore      2023-10-24  803  		rc =3D -ENOMEM;
d7cf3412a9f6c5 Paul Moore      2023-10-24  804  		goto out;
d7cf3412a9f6c5 Paul Moore      2023-10-24  805  	}
d7cf3412a9f6c5 Paul Moore      2023-10-24  806  	nctx->id =3D id;
d7cf3412a9f6c5 Paul Moore      2023-10-24  807  	nctx->flags =3D flags;
d7cf3412a9f6c5 Paul Moore      2023-10-24  808  	nctx->len =3D nctx_len;
d7cf3412a9f6c5 Paul Moore      2023-10-24  809  	nctx->ctx_len =3D val_len;
d7cf3412a9f6c5 Paul Moore      2023-10-24 @810  	memcpy(nctx->ctx, val, val=
_len);
e1ca7129db2c3b Casey Schaufler 2023-09-12  811 =20
d7cf3412a9f6c5 Paul Moore      2023-10-24  812  	if (copy_to_user(uctx, nct=
x, nctx_len))
e1ca7129db2c3b Casey Schaufler 2023-09-12  813  		rc =3D -EFAULT;
e1ca7129db2c3b Casey Schaufler 2023-09-12  814 =20
d7cf3412a9f6c5 Paul Moore      2023-10-24  815  out:
d7cf3412a9f6c5 Paul Moore      2023-10-24  816  	kfree(nctx);
d7cf3412a9f6c5 Paul Moore      2023-10-24  817  	*uctx_len =3D nctx_len;
e1ca7129db2c3b Casey Schaufler 2023-09-12  818  	return rc;
e1ca7129db2c3b Casey Schaufler 2023-09-12  819  }
e1ca7129db2c3b Casey Schaufler 2023-09-12  820 =20

:::::: The code at line 810 was first introduced by commit
:::::: d7cf3412a9f6c547e5ee443fa7644e08898aa3e2 lsm: consolidate buffer siz=
e handling into lsm_fill_user_ctx()

:::::: TO: Paul Moore <paul@paul-moore.com>
:::::: CC: Paul Moore <paul@paul-moore.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

