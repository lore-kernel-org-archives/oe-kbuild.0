Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9EE17EE
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Sep 2023 01:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695865983; x=1727401983;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=yZz1kcqqzgOtAQDlV8OiIO1Z7Bxyzxe1dg6D1SQq2m0=;
  b=El+fyfz/gzJstkfxuG0nnXe6llZvnve2ZFoPN8/YTA8KYyO34Fn3hgCG
   T722uWhw1AvEKhpdlpC7xUQCAe0HxUPq+rWysaqKNWsl/0CFAs3oWbtOR
   AcW/VcmnppGVdnXEDS/nMA9WEAglUvmQVdGGzEEZyZK3Rx6YtYXXFWHoo
   zZb3PeJzxREK0Wd2ST0zQxRXMXZYLm/m1Vb4tOq09spCcUtqPe6yCMkbd
   oD4c+9flmLkeAbQJf8S0rsgzcPnZtrPdKLjWrEPcXI/rj0GOHRgebqZGt
   h8KlY0p3AK/0EG91EYK2LXR8rmiN5PaWQZBWoxC2agoEt7hjDlgsDeSbE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="372323609"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="372323609"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 18:53:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="784536839"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="784536839"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 18:53:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 18:53:01 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 18:53:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 18:53:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 18:52:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TawF0KLVG22TQuIlESdefXj8wfL5Orc1Ne7GxA8/u6en0Becb8eZgmHoUdEwRVlLz/iT0wnXRexd2BHy4M6J9m6Qt59qo6TFPV9h1mtcV8wz4KnIkjxzcDyQQLyYnm2voJS8U9UT1B3VPd8kKjBlj5YgMUIgZ4G8drPZlcSCDxB3UFLRzZux0AFMHJ/ujyCzRkZiTyjiykHcu9Et9eWWBGyhCV0adF4eiAPw1mvNN7uFMo+O+FuT3MIZbV2EwdV82om+9sXjzBcE/Rk2bH0dkazxbbZPX4JANaDcrOczc3eCYD0gp63hWdrmSFn0zmzXRPbNr3qZUHtvCbcIGeP9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FchdlWFHuHxfRkczJIO1Sq3revkmU4mkcAZfOmBaYFc=;
 b=jAY/ua1c8QaqDhqcKQPyMlUGz5+VDoB3wczqE96ccZR+HbCbJi30oqWjoE1HYfh6uIIr0BMcyPR3KLZKsV/iBVixOY8fYUOIApHlA+Bmtxke0tObuJ/BFR8jdVbSYfCYwigAa2ILPMUPALAvu/JxI8T4krCXqjz0wlotGgXMzmCILdjuw6xgdjNki2MlpARkjA0BGC01S1JHo8mKH31PEsQBLuaS1IPLrTqaCbxou3t6q2ZbwwOk4bq1zE4eGqDuk5lbt3+AO/VdAfDcmKGuw8YBlLRbrC7QXCppfUX9Ibb8IW9a8WaU1BXKTiqi13oyFO2Mv5wBFjs1rKHj7/DGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 28 Sep
 2023 01:52:57 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6792.026; Thu, 28 Sep 2023
 01:52:57 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH vfio] vfio/pci: remove msi domain on msi disable
Thread-Topic: [PATCH vfio] vfio/pci: remove msi domain on msi disable
Thread-Index: AQHZ5+A0YVBp/hIJUUqrpneY8WfwcLAvi8rQ
Date: Thu, 28 Sep 2023 01:52:57 +0000
Message-ID: <CY5PR11MB6392C49BE907844C88E08D75FBC1A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202309152211.7YCkF75G-lkp@intel.com>
In-Reply-To: <202309152211.7YCkF75G-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SA2PR11MB4793:EE_
x-ms-office365-filtering-correlation-id: 22b229c9-ffc3-4f8b-ef40-08dbbfc5a374
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HzsqMoWMvKAfxNakgTP+lPuVCs1MIo4D82pywpuL7efXnU9IbLvsMSszcQxfgbnhx3rwQjNn2/087gkkESR3/Qh+Jkf+Bq0sY4hVbqB2+nehCOkcbwYytJiQrYAYGYxAh7VFuLJAP61STF1oSZ4zwgoiQKRSHKxDPP6F+3ini0yVTHiPk2o6DSBzZRLro80tJnjGTBnZpT82n5pm42nrliDMPzyYeUKozLqxnEAuFUEYOQmn3jwjj2Uk55Hg/bD+R9B0EvVJeHUYQCO6VFF9XbKItr6UDeVRFxbe5687SAayQDItjEQUeVG3jRx4nIQB6333mtvq/17cUAHjDMdE64yBwB05NdCHnba33PCrZN/iW6nlFI3XETohEHTQFEBG01Zh+GBjE9ZYq6FOAWWQHo0MQjYZLWa7pjx4xAEK9346sXEOMPd6bV52HAr1AKE2yZ2IgAufHumuScj6/A5cOAW56ldrqw56dKJPgFOB6EbwZfQ3juO+zelGI1gue76VaT6OStOq3knKzZ7274pb8Lwn+g8+ZgYWoid7H/9INg3sOOCXMRKkZXgWW0SWKGaNkQA1Ity6uovN/TllXQifnDA077c1gNlXzFzd3UKJd3wEa/5dkPwV7Hw3GYWW3yEs6tiFjkO1fekALd3mKpRKlQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(110136005)(5660300002)(52536014)(2906002)(66476007)(8676002)(38100700002)(316002)(8936002)(82960400001)(66446008)(66946007)(66556008)(76116006)(64756008)(33656002)(38070700005)(86362001)(55016003)(41300700001)(26005)(83380400001)(53546011)(122000001)(71200400001)(7696005)(6506007)(478600001)(9686003)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hzz60sDBTX3nSJvH3iL/pIBU7nCUabqgSCT9M3ifmT4NbnW8Uo7wE8oxpwlh?=
 =?us-ascii?Q?OCrlyZlg49V92WUNo6zAllfWHUYIDZTgLyD4bq8+XmF3He5k9OVCq2jYk52r?=
 =?us-ascii?Q?t75KWdyFrhuK54DoZuStOKkm+tynTeunGJz1qqYowkLyR+0N565GT0OzJ/UX?=
 =?us-ascii?Q?npcZF1A5oF/8WzaLnfoplsiJb+iotKS4zHeU7Hw7Y2ESHvnUxQaD1jOpE+Uc?=
 =?us-ascii?Q?LjNIOKY6tbxV2CS2Fb8TfPPHwfx0tks7V58Xy+LhIjGHvKvuHxrZfUwNMXQC?=
 =?us-ascii?Q?W/32WTms7F9Eavs1FATVoE+h/5xVkPD9V/7zDcBeV+/vBOaRa/n4q/e69cv7?=
 =?us-ascii?Q?nJcHwjTIjMjYptRDKIBcnZQAVWeKyn85b9VCfp5JuAY7QcraKBo6mCrEcI1I?=
 =?us-ascii?Q?r1IlW/ZU1j0PGe+O9dd/La8m8YmkbMDaf+FZCqKx1etINM1du8H0Ia8KTE17?=
 =?us-ascii?Q?+B+CwhXFS8leh3oFaeL2cUPwrpPQVKU1tq8v6uJnbVYAcAu8BRzcQ7fYsUYx?=
 =?us-ascii?Q?Xz2FY27MpWT5QawXeSF8FuJuFwpw0O6oBHwFj5wzm216ATr+QZ7hcqrYijjM?=
 =?us-ascii?Q?Vr2BTphswbYfvzuDpQizoLaw85lz79BcsAsmdDrQY/3OXt89ysxfCpKmF5TA?=
 =?us-ascii?Q?AtpyKvUVq7vrNv9Fb46i7oITMQA62mifXPRef8jNj1SeBe+AbNEPi49WkDwa?=
 =?us-ascii?Q?HnuZE45eeyrYNOP+4pOiBRoY0+/m9wqnEAk+3z3wL8J5dyCI9BzXYD1FT3H4?=
 =?us-ascii?Q?+FD4Yxkq8soF0oKjhbelBkTr1LtF+UspOdVKD9L6pXeRLmP6/pdUnMZDyKbG?=
 =?us-ascii?Q?mKP2EKChHU2MxLOU1HhT5abo55tSjeOHlBXruQ6rAB1G5RHzVST6PiPnfWlV?=
 =?us-ascii?Q?Uh23fv3y/UJdNJgEy9RVB1YyYc4WCkLwl+thRcpo+SoNY0JNJqMvPcZs5aGY?=
 =?us-ascii?Q?35BC3VO+mz+o0gWKhIZv7+mBg+vRpbUHRYzoZO8EDreUzmmYLxFz6LFSuVvv?=
 =?us-ascii?Q?d2XZvSGsDT5iOyqWzmWQCDOuSItHMSuNEJk33s/7MzJKTex6b1+xU2H7av/4?=
 =?us-ascii?Q?G97ToKBrKwx9YvNdWMz4kUkNQSiC008iC+XPNJrPQO/TgC/vEdOsfDtNpqxX?=
 =?us-ascii?Q?ClPHhQmNfSrMqwAF3nJqOyKmKlp6shHbLc7F8NbpasDmMG8crC4yN6zS7Rvw?=
 =?us-ascii?Q?HkWttva3K+Y7/SzvkKTvc8fHf7Jxu3ymhh20UnxnN/nrMAXah65l/L9G7D1j?=
 =?us-ascii?Q?+LwzR8+ZjeSO+p6qUwVeIKlKJ2G/F/Jphk9AZwNSFRC1Ru6CoyOldOl0zNwd?=
 =?us-ascii?Q?PPOeNfX48NLuM/COpdmsYgHNGbb54b58dij/NhlxP/Uq0E+sbkmmf0AilBtp?=
 =?us-ascii?Q?VsgH6IcJkaW3kO5uM4bnN8tm95SjRkl7rJlZei3qJLgReXd7PuXrRvYD4hiI?=
 =?us-ascii?Q?sJIQO9IhSHj3sNWewGC3OG574E3HwlP3eS+VHPLTJ6ijp6EJPQxQKElsVoYT?=
 =?us-ascii?Q?PrqveLOYjjf1ve4Zg5HgFmY4ZwyXAGRKQ7/4nz+7RoedzJuRVv3L8vT/kufp?=
 =?us-ascii?Q?Lux3YlnfLJLwT9OW8EF56QulyemRKd2KafOv1u99?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b229c9-ffc3-4f8b-ef40-08dbbfc5a374
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2023 01:52:57.4306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HgpCwjUVuE4H4F2WhRkGLfTN1Lhls1rldIS0mxfeVucx7BvIueZC6/AVgYwAdH58sy3GDl9fDz0k4U094dxg7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4793
X-OriginatorOrg: intel.com

not_report

There are two links pointing to valid patches, but only the first one was a=
pplied as prerequisite.

Link: https://lore.kernel.org/all/cover.1683740667.git.reinette.chatre@inte=
l.com/
Link: https://lore.kernel.org/r/20221124232325.798556374@linutronix.de

The whole commit message doesn't mention about whether the links should be =
appended or not.

Seems like the patch has been rejected.

On Mon, Sep 18, 2023 at 10:48:54AM -0700, Nelson, Shannon wrote:

> In our case, the VF device's msix count value found in PCI config space i=
s
> changed by device configuration management outside of the baremetal host =
and
> read by the QEMU instance when it starts up, and then read by the vfio PC=
I
> core when QEMU requests the first IRQ. =20

Oh, you definitely can't do that!

> This patch adds a msi_remove_device_irq_domain() call when the irqs are
> disabled in order to force a new read on the next IRQ allocation cycle. T=
his
> is limited to only the vfio use of the msi_domain.

Definately no.
=20
> I suppose we could add this to the trailing end of callbacks in our own
> driver, but this looks more like a generic vfio/msi issue than a driver
> specific thing.

Certainly not.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, September 15, 2023 22:22
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH vfio] vfio/pci: remove msi domain on msi disable

::::::=20
:::::: Manual check reason: "git am base is a link in commit message"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230914191406.54656-1-shannon.nelson@amd.com>
References: <20230914191406.54656-1-shannon.nelson@amd.com>
TO: Shannon Nelson <shannon.nelson@amd.com>
TO: alex.williamson@redhat.com
TO: jgg@ziepe.ca
TO: kevin.tian@intel.com
TO: reinette.chatre@intel.com
TO: tglx@linutronix.de
TO: kvm@vger.kernel.org
CC: shannon.nelson@amd.com
CC: brett.creeley@amd.com
CC: linux-kernel@vger.kernel.org

Hi Shannon,

kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/for-linus]
[cannot apply to awilliam-vfio/next linus/master v6.6-rc1 next-20230915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shannon-Nelson/vfio-=
pci-remove-msi-domain-on-msi-disable/20230915-031544
base:   https://github.com/awilliam/linux-vfio.git for-linus
patch link:    https://lore.kernel.org/r/20230914191406.54656-1-shannon.nel=
son%40amd.com
patch subject: [PATCH vfio] vfio/pci: remove msi domain on msi disable
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-071-20230915 (https://download.01.org/0day-ci/arc=
hive/20230915/202309152211.7YCkF75G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20230915/202309152211.7YCkF75G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309152211.7YCkF75G-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "msi_remove_device_irq_domain" [drivers/vfio/pci/vfio-pc=
i-core.ko] undefined!

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

