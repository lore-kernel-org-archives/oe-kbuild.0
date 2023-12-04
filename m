Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59941C2F
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJO16D4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701657655; x=1733193655;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=FjhjQEmw0npEkJCgt7VJrAKtKjUMmT+r/NrynUoiG7A=;
  b=eJO16D4ky3Tw86T4GPBN0trwAbKTdHoFlArznaveychRw1ZF5HHEFg/R
   6eP2ChOfrxUKTPBC1WhEEeTZX63EgB6jr71u8uvjI2dHpj24i573WbKOx
   RoZ/UTn2j/1XrXOOW3ItLDveOS7iFfPJmbEHRBvtoLYA9xboWI5d+NjVy
   4oiSF35vEEOSgcfnsFuZb5AjKyhnWOE+aytWuzuMPyb1TEy/3RpeYWIU5
   N+wQ/al138pbnwGnHuXbQlXgn+LauJVU34Wr7o2Mj8U/ixZYzCovHjEkI
   59XX7smg3LaVzA1L9VulL+eOunSTc6cUlp1vaLkLFkIsZfit4HBWLMasX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="12392743"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="12392743"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:40:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="804755003"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="804755003"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:40:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:40:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:40:49 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:40:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTJY/1q9G70o+zUu7IMoj2xaATyFaTaBhONCIKWmTMdAH9VnC4n2yNGknNKcuqlOp08M7SQ1Cr/9xTuptuNOjYQm68bpv39KlyaUZ611L9ETlwyeRY3UxgxUSrJILuQfUoel7r1TnJGup8rbtcQJrp/NIUuotrpt1b/Nwfhf5kH4esOsx3o+JPHi8Xd/83EJabLO0P1x+w749k4RKsCX3InCUPzsE1XOqe24uuiyp+Eb8Fc46EhdEJ9xtntMcN84ekVJ6EOmDxCn4z8B5Uo3QKUkQs6dRN83/ylaBURBAy/eB+/2OACG8Qu2DTTLK9JXKMtP5d1saFlMGxYgOBOyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GccCFlScp4vBdgDKGUBdy6VDswaJbjAjy7EG5oxRfMk=;
 b=Ttkxdi/8sb0BwvbUNBaaU2oz/XdMOgb5zejO8bfRHu98OscWxmuZxblQjYMWdsHsLgywFBkunW05ZMa5IBsP6ztcNjydrpyEUmfAImYayOorKNz/skj1VqNVPanOEAp5q+FHIN2A7IlXwbC5h7HXqfDPKnYXHsY7gTEofHFaCT+5WEeZ7xUfGKYOMOUNG9zar8v42tG3zWTR3ioxE6HzL5iO7OwmKOvaQQaJJMNZgJLRODalhMhgToZVmfSjQZhfLtrWhfGm+o8mHWU43UfcnFrTH9qe+sJHGzHX2WL8H2olTwibu9CaUGtiPsacUdq0z/QW3kY4vISFS4kDq8Bpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:40:48 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:40:47 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [RFC KERNEL PATCH v2 3/3] xen/privcmd: Add new syscall to get gsi
 from irq
Thread-Topic: [RFC KERNEL PATCH v2 3/3] xen/privcmd: Add new syscall to get
 gsi from irq
Thread-Index: AQHaJC7SyrKB49wKYECL1J7NyLexmrCYbiRw
Date: Mon, 4 Dec 2023 02:40:47 +0000
Message-ID: <CY5PR11MB639273449A373E767DACAF37FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312011652.YwfS8NBH-lkp@intel.com>
In-Reply-To: <202312011652.YwfS8NBH-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CY5PR11MB6259:EE_
x-ms-office365-filtering-correlation-id: 01564833-5c95-4802-eb27-08dbf4726c0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XE+bc0/i+RnbjOo0YYv2ptEMrNeuMyzNJ2eF4VXu95fQY/h8EOl1XaM/rQxhRe3Dmubvq3R+4PTzXy6+18ROnf7+ncjPWdsC75u9mo3gSVJtYZdz/rKasT91Vc/IGHV9RVx9eO6ZehdPL/6JyXgEFsB4MbwVMI/lV2eKhfx6DMurb5SBdO4S6V8qr7E7ql9q3+nIVp4LbNY/ForAhNy7pRKAuCVu2gwutms/F/MKG0TL430g/6LTPSsbA0W+yqow3ES7kA0538y1/EGsgQSlWqEOdUxn51wSTnjzj/JgsV5RoiJ32QXgaU4pItB5PJTX4ej68PTCoqmAbpWFB5NkuemnDjAmZUzpKEMYj782b1HvCXzWj+O1hBx3wuqkQsyjHnDAS8O03Deuw6DDgu7aDBf2KSvAm7HTChGeNMXSPrTdn44RR3BeBdW/rUHOZBVoxMRiN+Aps8mx3ln65R7n1csf4kMMAkMBl+DEdMkm3eLhlyzyQpD+7+uPNzttDzLx+JW1ZYIoBagYEmS4XzRjetR4zcRQp0cnVDrdHyKa4836RJ87/SUxzKCW3gr+1173/yW4HKCblsV2WNq/VQX8hzIyxOCHzc+8/hJCUIsyn/WVHOYlrcogChaS0PBTyI6cD0q48ofefZNwMQwhN4e8kn4RPLcQhOz48Dg3VuGDd5UJ1Z8S4+Zaiw9833Vkghyp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66446008)(64756008)(316002)(66476007)(8936002)(86362001)(8676002)(52536014)(66556008)(966005)(478600001)(110136005)(76116006)(66946007)(41300700001)(2906002)(5660300002)(33656002)(38070700009)(122000001)(26005)(9686003)(7696005)(6506007)(71200400001)(53546011)(83380400001)(82960400001)(38100700002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z6yUAkc0xtTmtuch5OzfWofzBF+SeexoNfi//aNlc8UkrmXN6DP9YvIn5Qlx?=
 =?us-ascii?Q?tN+8E3bqWSDb003vPYtZobJ8wjaTtM50mHEOuB6ltMLu9ZWh+scAENeCyeF/?=
 =?us-ascii?Q?/oWKoQE6eQD8w5NLwxDGS4YTcX+Vb2pHf45ZUNlWayOqC9cidXuotZlqjAmm?=
 =?us-ascii?Q?pHJCQXtwXSxAu+Fd23/GSCuDjioyM7Vfiz0uGjQejP7xl7E/vUZaggIr5wLY?=
 =?us-ascii?Q?LCO+U3138ONmPntHCZnFPbrFxyMof1Q+UUpeWcC00pYjiqe55p6L2kc4LYhY?=
 =?us-ascii?Q?tqPu/a/OsTWwFFpLKDzIRCbvWCsv6bOFSXSHk+F6kHEW6cb4D5ACjMrumRp7?=
 =?us-ascii?Q?NdMRgf/I3fQFSC5TmP3AuhMDgGbaUH6HEUd7mvbBNPWCfrQb5u8w0DRF3WhK?=
 =?us-ascii?Q?UsMltQhISyVgyia2v/ybab/poBghCemeaOFJ0oy9E0RafF4YVtKs+aeTvk6Z?=
 =?us-ascii?Q?YBS8TAGKsHhT0xjVHk/Zjf+qDurk2EQqIzfy0kyHEtv1vwyv8vcjalLIUncD?=
 =?us-ascii?Q?rY11xtueCT1rqmGABxpSbjQ7d4vLw1+NjsiWTbUJvTNMH9xy9BG2UltPzHGS?=
 =?us-ascii?Q?ZxdmzHUcxWL/nSmGQA8i/w72gd1nh05u6kZvwf5ro5HcOk8sqjLbYevljb1s?=
 =?us-ascii?Q?Ale1Net9kafLsiCITzMK+CxmMfixgaz/P/F9bH5ectK03aeUVFY9YefHCEoN?=
 =?us-ascii?Q?5t40vrNBl69prw92dwakC4Z+rrF7tLbM+2IdzY3JpRy0pBsnKvVteUhkbG24?=
 =?us-ascii?Q?0fRMAWdhxEEUCYYO2OSDlNYr5cgTrfubnDRwQvuEf48hLT9yicYPmmWCidzQ?=
 =?us-ascii?Q?8QaXA4Tjsd7R2ZbzUjNCmh2V6GopB0kVXL77CYW7+mQIje5oOnLKjPU57V1a?=
 =?us-ascii?Q?5Ph4HkV/jjy3gRwBPJDqLDeogpynKK3hCUewPlVmWzEO8csuDgVplYX38Z0B?=
 =?us-ascii?Q?9xbZV7n5ttUmJWkSJBheTzkQ1wg5P93wBUoxJCDY+g5g+C6Z23cNQxzh5tAA?=
 =?us-ascii?Q?aDvL8uhgHYv7xvbaHyeSF9XZgcdKgVKfGQGRd7l24XiN62nD0zg/szhSw6MV?=
 =?us-ascii?Q?bLSo+B5mufsqM4ZrN+jCBnSl+0S99MEaHNAJNhRrOVOgnZCQa85wANWxmlU0?=
 =?us-ascii?Q?/DvIP40vtmJI7Y0wetzEdlUNIjKpKb41yYKFdeWT7rTqVgNBuhmUJGADhTrs?=
 =?us-ascii?Q?Yt0fh5/DlSojm3V285Sdgk6qe9g8apf/TB4aPMLS6AU50wvfa1LkZjYcWEI4?=
 =?us-ascii?Q?SsBzCjFz+mgrnXHF4JlRhA1z2Zfg1f/lSWoRSysBrqkDdX1b2SEwO9YIWICW?=
 =?us-ascii?Q?wsC8XyybGuZv7xGOEUG8ghwlD+rH9Js8xOxtTb8YaYknjl6XShw3ji8JNLPk?=
 =?us-ascii?Q?3TaIsEWNZj/SlfTXzevLGjJNv2H95150EFBCaWR1A8Q87Qlc1zwssvLo0spW?=
 =?us-ascii?Q?4JUcrOdCIQRv8nEjwCCcHawA3O+BR9TkdmTRxX83h9cgTBXklmpBWECMFTvQ?=
 =?us-ascii?Q?6FGgQSYaU6boJXPO4mHW/0Vkq9OK+gfnlquoeAqqmWVoYROY6JMvJ5bDafhl?=
 =?us-ascii?Q?EeHgXgglLNIB4O7mOnzP7/gL/AWW8GPJsisuzARo?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 01564833-5c95-4802-eb27-08dbf4726c0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:40:47.8688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pN8hmhDgygc+Xqoh1Lwm4afQVvTkENnspAfIBRSuj6hiOmAf0OtcvY9pqByy+FDPIqFmP5v2ugmL3pv+lK6jTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/all/202311250440.DbUQXNLK-lkp@intel.co=
m/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, December 1, 2023 16:14
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [RFC KERNEL PATCH v2 3/3] xen/privcmd: Add new syscall to get =
gsi from irq

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231124103123.3263471-4-Jiqian.Chen@amd.com>
References: <20231124103123.3263471-4-Jiqian.Chen@amd.com>
TO: Jiqian Chen <Jiqian.Chen@amd.com>

Hi Jiqian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.7-rc1]
[cannot apply to xen-tip/linux-next tip/irq/core tip/x86/core linus/master =
v6.7-rc2 next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiqian-Chen/xen-pci-=
Add-xen_reset_device_state-function/20231124-183607
base:   v6.7-rc1
patch link:    https://lore.kernel.org/r/20231124103123.3263471-4-Jiqian.Ch=
en%40amd.com
patch subject: [RFC KERNEL PATCH v2 3/3] xen/privcmd: Add new syscall to ge=
t gsi from irq
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312011652.Y=
wfS8NBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312011652.YwfS8NBH-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/xen/privcmd.c: xen/events.h is included more than once.

vim +38 drivers/xen/privcmd.c

    36=09
    37	#include <xen/xen.h>
  > 38	#include <xen/events.h>
    39	#include <xen/privcmd.h>
    40	#include <xen/interface/xen.h>
    41	#include <xen/interface/memory.h>
    42	#include <xen/interface/hvm/dm_op.h>
    43	#include <xen/interface/hvm/ioreq.h>
    44	#include <xen/features.h>
    45	#include <xen/page.h>
    46	#include <xen/xen-ops.h>
    47	#include <xen/balloon.h>
  > 48	#include <xen/events.h>
    49=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

