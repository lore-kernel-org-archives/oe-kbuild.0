Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8111709
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 05:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alDw/SbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700630886; x=1732166886;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=oNwj5XoXfufKFwchxIngB/9ZyZyx3DQA2qVqwFmI4T4=;
  b=alDw/SbFAGjhpHaye5VX32tKxvsiotLfm6VICIMSA8ccZSib40G+WeYF
   9YKxmS+pIkE6u6GdHP50idkTKOgwi/J0SjnqtNvz9exc5N5w0jWVXDjv9
   f/3u9q/1zW4GnuXsLMhMTC4Hj2r497ZYyfneaJH3whlgHJzUO4/2Vqs7T
   QoJA+myhd/qExKuTGv8arwXdBKBW9v6HjVw0hLTgxDesA5naUgaEg+UOk
   w1wcuw5ermGrX8NEF9zMWCxI2kEEOEPlqUNZ2BSmdSimxrhhuqF9aMWWe
   q7fnkxd9RbCImBvhRcwSUMelR+aiJfC42X3Cv/+rbm7ftfmVJKMKaP2gP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="382382655"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="382382655"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 21:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857537406"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="857537406"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Nov 2023 21:28:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 21:28:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 21:28:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 21:28:04 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 21:27:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HubT9f6oCFqBPN2ErYFzz/VixyIS44aBMm46E7k38SGJpjbuf2/Bfsk4XN97RTQOb8eqwP8xTuFdx+06vRF2ynHAznShg0Rxrx9g+8Jeh/5zkT3wd8wKdyNRmns7CtbPBPriAde++3zrJQAh6CGzmQt7PUuoU0mIzg0aVkfpwlXIotY6Frmk7tvwdPby7YD9PLdJkx67Al3wMMyEP/EjoPYoxwsr8d4D2DejUuLMyvEj3YDYQZiNEp0FocS74FeLF7viWHWlYhh5srV/AEbg9ceJRnLU3xTA7lyw9LsgsPUwVxjx33SYaQi02TiJHOGk8/L2koW6b7rPHAaNNWJcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KO+M+h0tNjqN+t6w4Ondyai49ObHO3MkK9NquvE00QA=;
 b=PUysQV5kEOWy59PJJ/RQ1TOSNwPhYlzMPpGD/pOIZRMZYgGtuzoZWlCAwmJF5txGSL29/0hcQyNowQXy3ATZzXEi1IEzJt6L453DD06ZPhVq7C4QUPvhXedFNwC7I8fHlNvjbqmGsN6vItTHQDNT0T/F9X85hhhwxfNZf9WhWpm8erzS/pgVonelxLc3M2B9sT/e54Psr18M8NeGUJ/xSoeYoIk0Z0c7ok74mGTseDdgua5WhjxVPtjKGbfjfKLRSgNM/tYIDfl64cg9UNmPSF7LMlIEvut8zqpELl7KkNbz5LyDv7sA5IhwJbXSzTVu3bBmcOCJw2o6W6+lOw/JfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB8027.namprd11.prod.outlook.com (2603:10b6:806:2de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 05:27:46 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 05:27:45 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 7/20]
 iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared; did
 you mean 'IOMMU_HWPT_DATA_SELFTEST'?
Thread-Topic: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 7/20]
 iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared; did
 you mean 'IOMMU_HWPT_DATA_SELFTEST'?
Thread-Index: AQHaHIi2ifC7iAnSWEq7uiPJFrpS/bCFz/8g
Date: Wed, 22 Nov 2023 05:27:44 +0000
Message-ID: <CY5PR11MB63922FEF1A361F3A33945667FBBAA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311212250.lTDgKUwk-lkp@intel.com>
In-Reply-To: <202311212250.lTDgKUwk-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SN7PR11MB8027:EE_
x-ms-office365-filtering-correlation-id: e41dddd4-593e-4554-8836-08dbeb1bc19d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7U+I7q8PQjtCZALez6QlUXVb8ghddyiScsPPiRcNX+UHtCZ/xkA6/mTaMA8q0K/Gv4MzTQVJtb4zbQ7mzdVnrkSNU3SQYbRAFkU/gDAmZN+yu8rh3nAiipSKnXONqAUWWu00npWVpVJzsYEBjKYxuZNm0rRrbCAgVxsTU9uvL2CiRWInWkX9Dgwzk+2qcCwcauFy0WtyqF41Sx+Lmzc7hh0LM+rk2Wstaj0MB395tjWT9EMMjS0oFceTDWCoGK2AHJ295g6/ACXualczwcKPkr1O7NfohMbdeKPjiZsqojMCdRAQo8UvdNLFn9pS0a4ju+7cbxb/ce2pwYXYcfqYrEu/XileHj9JNB+jrD7bFy0QG5kd8S5WyiJB0s9JmhFgnIXjoBttXj6cGB2QBASl0vsQFnNDxbjdqivVEfbUbvy+f60lW31TjyoZ5jx9T8r4UAX8HlWi1spsQYo0ephICTHWVod3dnHlO54zbcKshx1jHvggdTIsqqccd0/D8DR4K21z9gHW2kK5JI2hNTULByZSyaqwPSM9x2Loia1TdkNdWJlHogPxZcCOkCoVXsnePADoSOZzxmLYv4UExUdaXaNigyJQmNT5Uyv6/n2g7M8LYTKjSsZrWyg+x2fKl4We525DECAmqKQFeCgtqhyLow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(396003)(366004)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(66476007)(66946007)(66446008)(64756008)(76116006)(316002)(66556008)(110136005)(71200400001)(6506007)(7696005)(53546011)(9686003)(38070700009)(478600001)(966005)(26005)(82960400001)(33656002)(83380400001)(122000001)(38100700002)(86362001)(52536014)(2906002)(5660300002)(55016003)(8676002)(41300700001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jk/IVFIVI213KW1ecXW7hvP7p9K/GQJbuPaMpF57JqpkH6ntGEgIwebOyaAN?=
 =?us-ascii?Q?FrgiB2xMi0XXEwlHCUh7gyXLUFPvsbPOvJjOR85bSjjPLJM/Pb/EoEkGxzfF?=
 =?us-ascii?Q?BeHTKILqZjebrHCTmCrXxchf1p5ycMh1KNcsBNDTqDFfaIsA5E3RxNa7Es9j?=
 =?us-ascii?Q?r88xTY4Q2JKItktljjzWB9DgUMrGhClRhYb6Ser7J8sk7QtHUL7Hm3lMjFhs?=
 =?us-ascii?Q?7/tPeyMHg/eijKcq6BlMrhqb+RApxi3wYYUI5kU4Qo1+6QSBVqdH5eM3LCEI?=
 =?us-ascii?Q?y0oRP/WBeHq/oJBNyXjeTNrEmB1B73g+Wg7FdJSbFF43P7rYjS3aWbPJz7Qk?=
 =?us-ascii?Q?xeSElACoOUSqydSKoMxiDVs0KFPPfTpf6sVZHPmGCPA7qb9eGm7MpbzP4K+o?=
 =?us-ascii?Q?1UekZCcys9E3wWNt21DUyaDr/+oLx+T4zDr8yMAYl/CU5w2MGjy7TcUCDRSA?=
 =?us-ascii?Q?6SOmnTPHd3CyIP9oQMmtaN2pDJEKrzEkEeBkDkOuvqd69Zj097xCbGceC/XR?=
 =?us-ascii?Q?OFp8CZLTH9IvSF7qBHJVkqFBnGK7nCK04vFD8aGITFBAAGvwXo/EhoGuliG9?=
 =?us-ascii?Q?rNea7U4fdB8nBROh6Sb6c/duBubze8ZVbKXkHb6HuBi53vf3/MGxysrsjb9d?=
 =?us-ascii?Q?ZFdS/0DRvJ5LLtiyLPpooUOod0kw2HTi7AdJEq0TgLD7G5M7Xl/2yAK9PMoP?=
 =?us-ascii?Q?RNXyEkY0b3leN/pbPNfdwjJ0lOhla+rB+IhdZQcBXGjJxwlxF/2truVDl1lV?=
 =?us-ascii?Q?Z82VEsdtM946ossFJANUpOR8gMCxxBdQkbvReu4GDG+UwfLH+8TK5S6uizHs?=
 =?us-ascii?Q?+U1m5F297aQfvOHeVRL2xF+lcXz1tKzERsURpFNy/H7qFT/XYQXDYhLIQVDS?=
 =?us-ascii?Q?4nOFjPDFo9107QeJKsYWVQrhG9rYtSvUV+o0Q5EG8y+G1rsP/seVaNIvfzYn?=
 =?us-ascii?Q?h5JpciETyaZsSVukW7WbNsszz4BwHxWw6Tk4gZT8AJFEtd5pDM68mOvO0Lkc?=
 =?us-ascii?Q?XHRVvo9jrb3yj/Q4lJVtIjSA3KQXzOl1ac5mcIrguPG00BOrJNfx3BjafbXo?=
 =?us-ascii?Q?iCg6exW0Ei9xk81syw1nmk9gzBIMclTKAquscH8bHVT6WEApnU4ooduYcEQL?=
 =?us-ascii?Q?xQos67vdZlB7a536ZC0zeju8dvGHnu3OP84eOZDXVcDbsZ5OM8v+I6HggkMT?=
 =?us-ascii?Q?jJ3sKZJfE1faLFgrcqJ/hOUWAf8cooNLKhmoa18OU3ZS3c+WGUbW6oDF3L0t?=
 =?us-ascii?Q?U608iMg1j+idzIoiEyqk9SQ/MWs3BcKDE9CWOTPpPZYU+qc5fnjn0l8u0gpr?=
 =?us-ascii?Q?W9fqlz6eCNaNWjdSEAmvhEJi5qbg5iMG5WPihfis6Nd8PRe77KJwS7LoO5/K?=
 =?us-ascii?Q?G1TRo1NNFg04yJetpER2qJoAUivVz+R6bGKKl8v9UFB0pX8PH5R+DxqTsHj4?=
 =?us-ascii?Q?fS1tq6B7YiVLrvLEdkNle3MHi5nYg+VtQLftZVxIzreUYsET1kjeQdYSZo6S?=
 =?us-ascii?Q?bQY22y9VEIWBUNQ9Xgz3E5l/r+pDL7G7fm7rxE8SecbNBXmHRkr8c3uJBriS?=
 =?us-ascii?Q?dxD2MnLPLcdREtS7kpl5XKU9A1h6ooMif5rUFTkI?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e41dddd4-593e-4554-8836-08dbeb1bc19d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 05:27:44.7996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+rN83Z3fBmlpkyaXMsw6vaQhcd8PZ1vJm6zf+exPHim5muXQqK2ZsM+MG+KlBQdwtJzjiWxoLhDtRtyOD0ETg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8027
X-OriginatorOrg: intel.com

not_report

"Work In Progress" branch

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, November 21, 2023 22:38
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 7/20] iom=
mufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared; did you=
 mean 'IOMMU_HWPT_DATA_SELFTEST'?

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yi Liu <yi.l.liu@intel.com>
TO: Kevin Tian <kevin.tian@intel.com>

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting+pasid-=
11142023-yi
head:   92f313909ee3753f73c9b3341a34aa28116edb62
commit: 731261dcd9270387e7ed95813ad05a02c01006d8 [7/20] iommufd/selftest: A=
dd coverage for iommufd pasid attach/detach
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231121/202311212250.lTDgKUwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311212250.lTDgKUwk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from iommufd_utils.h:13,
                    from iommufd.c:10:
   iommufd.c: In function 'iommufd_device_pasid_pasid_attach':
>> iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared (f=
irst use in this function); did you mean 'IOMMU_HWPT_DATA_SELFTEST'?
    2266 |                                            IOMMU_HWPT_ALLOC_DATA=
_SELFTEST,
         |                                            ^~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
     707 |         __typeof__(_seen) __seen =3D (_seen); \
         |                    ^~~~~
   iommufd_utils.h:190:9: note: in expansion of macro 'ASSERT_EQ'
     190 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, p=
t_id, flags, \
         |         ^~~~~~~~~
   iommufd.c:2264:17: note: in expansion of macro 'test_cmd_hwpt_alloc_nest=
ed'
    2264 |                 test_cmd_hwpt_alloc_nested(self->device_id, pare=
nt_hwpt_id, 0,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   iommufd.c:2266:44: note: each undeclared identifier is reported only onc=
e for each function it appears in
    2266 |                                            IOMMU_HWPT_ALLOC_DATA=
_SELFTEST,
         |                                            ^~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
     707 |         __typeof__(_seen) __seen =3D (_seen); \
         |                    ^~~~~
   iommufd_utils.h:190:9: note: in expansion of macro 'ASSERT_EQ'
     190 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, p=
t_id, flags, \
         |         ^~~~~~~~~
   iommufd.c:2264:17: note: in expansion of macro 'test_cmd_hwpt_alloc_nest=
ed'
    2264 |                 test_cmd_hwpt_alloc_nested(self->device_id, pare=
nt_hwpt_id, 0,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

