Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5CA1170E
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 05:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvTef4dM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700630887; x=1732166887;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=14wnF35AjXniVv8MzSFlbtK9od4EXgowBOex3PYIi1U=;
  b=JvTef4dMffgfGhrhmKqJu9I4c+ECEy1q/v1w13Ru4OEN8cp0vZZbd1on
   mbKvRXooFg/lUPcTrXKoKV+jki6TQbRhfqvWXJQIvBfQBECIMTdrOQlVj
   fb8EWpSVoV9A7DxhywuMkowwmyLf7dOn+GivljZPLCdZwR1/+cuUKRLuw
   cgiG8vUL2JRUMh5cUVl/mcbg7UITus1qttRIhXnHD+4DKm/bZpKW9XypH
   01RMgx33gWfyChq4blp4uq2eACEsjiC65UV1Mh8TkjG8ySKnfNZZUTJXj
   8uWKx+J2nZrNxX4JHbDtxQahvXy6r5YYPm11xHRH2bjmuq4UP4OxpT4f3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="423075192"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="423075192"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 21:28:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="832897789"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="832897789"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Nov 2023 21:28:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 21:28:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 21:28:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 21:28:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFZJk5PnmwquBTry9VwNm3+lQrupXv+z1rk5wHfuUFG+Vbv19bMlG4DCPSZW/Feth2iN6uy0meMwRJZAvNUeDXud6BnBj1RBLJjB4QRSeLKnzy8s+Lk/PwUTBkUnB51tP4eJY2WfJ1Uc2Y7g6OEUGd5ztl6IwLcBy8z5kbRmVbIPq/jLnPAXuKjGWkxtSDvcWm9RBAMwf1OezeJP/IVlislUphyyGfxQsId3dxrjFmIqGbeJwaukHw1wYTVoQMFwjjCc744bSR+5z3rzcnBXJTmc6cfGuAPs9ZuwZl0R9wqDCE/8pHUjLrp9fDrgB14QhhOC2rdUUMWchEM63DJw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBTVzBU+y8XLs5sU8crE+5PFXxwlysGwyBrE80nGIjw=;
 b=TDy8SHEUuivqD4Xzid7+dCtK2FuZ1Zi0XRephgbAmXg/Y/9jrNuR5I4QlhaK0c/G+9R+pEkaog7TTUI/uNV5+VxIf8RNoJSSFThm9GwBEbQySdfX7orz9VFyoXl32iZX1AWwmlYih5hbvqpNJ5GQYwaN/6ej84DHOG+faMSqUIDC/FyuhXTOWDa5BrvxIQgXLoqhlqSqUukGQQe7XtUUWa5ZNEGbVYy8KXWbk0J0ea9bkLZXX/Yvp8vswZ5Qhwpa3sz/lTHb11LBZMw0Ks1wUXAEkr1Y3lolVJo2MHsad0muOK3iVaTbs5FyKw6hp4fCYlt2gUK2RQXCS3wSBDu1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB8027.namprd11.prod.outlook.com (2603:10b6:806:2de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 05:28:04 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 05:28:04 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 17/20]
 iommufd.c:1676:44: error: macro "test_cmd_mock_domain" requires 5 arguments,
 but only 4 given
Thread-Topic: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 17/20]
 iommufd.c:1676:44: error: macro "test_cmd_mock_domain" requires 5 arguments,
 but only 4 given
Thread-Index: AQHaHKTg3+mYZXpDEESJeVHxthlh97CFz/mg
Date: Wed, 22 Nov 2023 05:28:03 +0000
Message-ID: <CY5PR11MB63925A82779678EF5E82C989FBBAA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311220103.2mel2uEZ-lkp@intel.com>
In-Reply-To: <202311220103.2mel2uEZ-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SN7PR11MB8027:EE_
x-ms-office365-filtering-correlation-id: d6120c50-9e4c-45ee-f664-08dbeb1bcd0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gcxu6u2qWpyun7SQV8HPWKnlWB1GgL0yPHEAhKkIeyChI5LGeu/rCmps78HrKZhobgUTFPuI9vRtR+igt+Z+J0qjN/jYhptZsNfiztFXpKDhVfjTEQjknd7Rr3BXZnOW9tuAwFxd/djWWO7jO7cd43XR4JGPAeboXpkHdmlYlWSgcGGxXBiTMyPeWEn3s7jzRMzM2eWRlkLYv0FVUqZnHmIvZYUAXhjS18iYniXq65Mzg8H2dQYXfrKGmX6PZALZMPMUITyBzPD8KUctcmuZTh2Baz/gwK36+O7vkqXabqXdVxNYxQ/+IhKdYa5Nv4+oxGmFfVRKmKcFE9URYoAzUY8Hlcp7Stqbw660iuFkyTbdwcej/HQSiy4QTDebItQR+hVZObiL5PHWEElyp+OLZSXJlCtYbaTzlnrXfSSCArWvACf5+fDwqnzbTIJxGEi23UUzLf0OxQnR92txWOElrJBUGAVJm5iUF6qKEhisUa0xsojIICZ53SG2L4+lWezQVSVq+rDUO5TAPpBEj+wFiSdowQwJjzvTwu+eiJEx03ngUFMy5vLls6N86HSe1DQQeQRzRTwe8Hci5GBJrLu83WVC/N+P6Hi2YT2Lp2KuaxabaB1zzHfsLV0qVzlAQ3eOolpttY7zzuSdVeBRn6N4ug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(396003)(366004)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(66476007)(66946007)(66446008)(64756008)(76116006)(316002)(66556008)(110136005)(71200400001)(6506007)(7696005)(53546011)(9686003)(38070700009)(478600001)(966005)(26005)(82960400001)(33656002)(83380400001)(122000001)(38100700002)(86362001)(52536014)(2906002)(5660300002)(55016003)(8676002)(41300700001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eW5jbD/lf3/VTBhW+eqxoCJBcHpPqwx6ap49dCZ+iAFNENFTez+ESKt9hlyg?=
 =?us-ascii?Q?UpecDdWqdlFq6xovRCL49AZEcHsw0zW4eaot0OqVgUTMY3f+cDIY73Spqs+v?=
 =?us-ascii?Q?Qrk0go+Ic2GcWvRHdxx/CxyvVDnCMSY9vyVjPLdbGOFdcYExKJmmtHRg7+q4?=
 =?us-ascii?Q?rkBhdu2rW4EvM0lqWENjVyC85ltq57gjvSPmgE/NQJVDz4CQIVPaNT/phxiu?=
 =?us-ascii?Q?kUsH4KT+Fc/rz91t5RQ9Ib15xv0SJh/7ZV40O/CJnhVuATewzCe4sZTVtA3Y?=
 =?us-ascii?Q?133byaI79Fzd/Ix9fqxASUGHGLb4W99TVhrNNP2hQ2K1AbKdR89igYDYlTzo?=
 =?us-ascii?Q?+YBZZugPcgvsr9z+zHA3EJG/pW5LlxCBGihOFV0YHLw/OA/2qVvXVqLnO14Q?=
 =?us-ascii?Q?Pt7MIbKZhWsBnXBB0QtWtUvp7Y20Qkn4ga5CjsjPOPoURFgrsp4Mc9VGl5zC?=
 =?us-ascii?Q?fVknPbvr26Y7HSwwAXWUsJwZ0PPrKo7kmedOSPIAnH/l8GIoZ+mxNlvMKfcc?=
 =?us-ascii?Q?QK82OppPuEFdsiEBszsxfkbiubVuYM4a2NVYj2M/eJL9qotY3VjDRkYKt6cr?=
 =?us-ascii?Q?HsgcqbSDoBt52QHQCs4qNX3BD5HwNK86KNI1qhT1JpPcXW6FFWJU8SKJvA/n?=
 =?us-ascii?Q?6/P1NdacjcfqUUCdFQcPW/zTCHkZcgCsB0kHkBn2IUZZKKKPIERBobFvap6W?=
 =?us-ascii?Q?1kJUxhIbjQexc8/r4LVVaWSyjayz8nqkIM0UAIFd8BG3i8zOc91MGQRBPgQi?=
 =?us-ascii?Q?8PaRSGfZ09zZUo28EQ8ezrRjLCheLQxUbQyh85/QWmJnfp5O+4YqQ6DvDqbi?=
 =?us-ascii?Q?U9hBNHK8AqCHhj9lKFHx9Oq2YOK0cQysfGV9/j9vIl6U4wIB5STLKUc0p5JU?=
 =?us-ascii?Q?z+n3CY0nQNJ3Db/nQN1PP/VB+k3+BqXfbIKBbO0Qo6dDjdlCio6+D/eiHiyv?=
 =?us-ascii?Q?tzVoNhceWbiQ3b3H6Ei1kGdODE8s1JoyZ660wdPClHD2MDY+eLLJMxTLb4UB?=
 =?us-ascii?Q?G2v2DUWmsmiNGyQmSgy1UqmwBB5hVs8Jiq9d8iadrhzW5iwY0Ndjn40moP4R?=
 =?us-ascii?Q?GWvpGmuNV7EgE5rtrq7N62YnY3lNvrQ7hiz8EWb7WO8I/jokIErwnQ8N7Z5s?=
 =?us-ascii?Q?MkI/boAAOKxbkows6MtRyk3sZibul8kL3zw6zMgRp+jWWHMDQUjiz0p7KFds?=
 =?us-ascii?Q?G64ec5u/Jt8SkB1vHXLmg9jTmU8rSci/dM1eDMNiooEJRyZ9gOM8ujhIlupK?=
 =?us-ascii?Q?Hrh+Wf+6/TNxn+UGQ37KqBeOETA5U7kWV0Rck+0ed865SfGv+Js9pEzIuLRj?=
 =?us-ascii?Q?/cjpzTUK3of6EfQK8iymbN2plD7sn6/+N93vsseC0HwhB7Dzhqtgs+hQiOh+?=
 =?us-ascii?Q?w/482g4ml1VxYBqKiV01kK9Yg82edLPFXbLJLulJyvxkAoEe9FXw31vWQh2p?=
 =?us-ascii?Q?DkcR73WZ0jLqHa7Ib0GsqhtySwTbVD7L50d4E/uSigf8Ooxvo7UEbOl8LeMr?=
 =?us-ascii?Q?xP9n34XCQUuDSmBPHLAITsWom5G68pvlI0QBqCoTlB/hGwgsuJNa9d/Et+sT?=
 =?us-ascii?Q?5MHwENNYcjKVP+UGO9MAjDSqXkLMvCenjFOw825c?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d6120c50-9e4c-45ee-f664-08dbeb1bcd0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 05:28:03.9302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EC7+CpathkN7h9ATP20hMvSEDexd6xGBM8sdsCb8CY0XivwaY+ldAQzWwGDVra6Z6Jo65eaJzyq57takgmXuRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8027
X-OriginatorOrg: intel.com

not_report=20

"Work In Progress" branch

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Wednesday, November 22, 2023 01:58
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 17/20] io=
mmufd.c:1676:44: error: macro "test_cmd_mock_domain" requires 5 arguments, =
but only 4 given

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
commit: 706387616ffbf6d04773de49dc53324f599d2e64 [17/20] iommufd/selftest: =
Extend IOMMU_TEST_OP_MOCK_DOMAIN to pass in pasid
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231122/202311220103.2mel2uEZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311220103.2mel2uEZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   iommufd.c: In function 'iommufd_dirty_tracking_setup':
>> iommufd.c:1676:44: error: macro "test_cmd_mock_domain" requires 5 argume=
nts, but only 4 given
    1676 |                              &self->idev_id);
         |                                            ^
   In file included from iommufd.c:10:
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, =
idev_id)   \
         |=20
>> iommufd.c:1675:9: error: 'test_cmd_mock_domain' undeclared (first use in=
 this function); did you mean '_test_cmd_mock_domain'?
    1675 |         test_cmd_mock_domain(self->ioas_id, &self->stdev_id, &se=
lf->hwpt_id,
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c:1675:9: note: each undeclared identifier is reported only once=
 for each function it appears in
   iommufd.c: In function 'iommufd_dirty_tracking_enforce_dirty':
   iommufd.c:1726:61: error: macro "test_cmd_mock_domain" requires 5 argume=
nts, but only 4 given
    1726 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, =
idev_id)   \
         |=20
   iommufd.c:1726:9: error: 'test_cmd_mock_domain' undeclared (first use in=
 this function); did you mean '_test_cmd_mock_domain'?
    1726 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c: In function 'iommufd_dirty_tracking_set_dirty_tracking':
   iommufd.c:1748:61: error: macro "test_cmd_mock_domain" requires 5 argume=
nts, but only 4 given
    1748 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, =
idev_id)   \
         |=20
   iommufd.c:1748:9: error: 'test_cmd_mock_domain' undeclared (first use in=
 this function); did you mean '_test_cmd_mock_domain'?
    1748 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c: In function 'iommufd_dirty_tracking_device_dirty_capability':
   iommufd.c:1763:61: error: macro "test_cmd_mock_domain" requires 5 argume=
nts, but only 4 given
    1763 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, =
idev_id)   \
         |=20
   iommufd.c:1763:9: error: 'test_cmd_mock_domain' undeclared (first use in=
 this function); did you mean '_test_cmd_mock_domain'?
    1763 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c: In function 'iommufd_dirty_tracking_get_dirty_bitmap':
   iommufd.c:1785:61: error: macro "test_cmd_mock_domain" requires 5 argume=
nts, but only 4 given
    1785 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, =
idev_id)   \
         |=20
   iommufd.c:1785:9: error: 'test_cmd_mock_domain' undeclared (first use in=
 this function); did you mean '_test_cmd_mock_domain'?
    1785 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c: In function 'iommufd_dirty_tracking_get_dirty_bitmap_no_clear=
':
   iommufd.c:1815:61: error: macro "test_cmd_mock_domain" requires 5 argume=
nts, but only 4 given
    1815 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, =
idev_id)   \
         |=20
   iommufd.c:1815:9: error: 'test_cmd_mock_domain' undeclared (first use in=
 this function); did you mean '_test_cmd_mock_domain'?
    1815 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   In file included from iommufd_utils.h:13:
   iommufd.c: In function 'iommufd_device_pasid_pasid_attach':
   iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared (f=
irst use in this function); did you mean 'IOMMU_HWPT_DATA_SELFTEST'?
    2266 |                                            IOMMU_HWPT_ALLOC_DATA=
_SELFTEST,
         |                                            ^~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
     707 |         __typeof__(_seen) __seen =3D (_seen); \
         |                    ^~~~~
   iommufd_utils.h:193:9: note: in expansion of macro 'ASSERT_EQ'
     193 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, p=
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

