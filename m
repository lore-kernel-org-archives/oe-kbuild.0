Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F55F642
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpJMg0HB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701657529; x=1733193529;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=KpUjy5TnQkZyXZDJm4EWmSAQd/fckevLQFP5LCdfyOc=;
  b=TpJMg0HBDRkVjk3BUAOoKavQpmU5XL6KeHwFsp+PITJJkwxVFfbHzlGl
   Xy98XdF2ni4P36FtCbNpYCRow01lYyLDMBj3nx7NLzWC9M9ACQVZRkUpS
   eMHqtrKE53mPbwLsfXMb5eA6XBAQAGSH+tCfu7ywg+dhDd8uFbYT3b1mw
   qPrPcLsV/ySepSK7n7139/qxtfVM5ez0Jfn3HmylC2afBV4JmIVW2jPD7
   bRrSqjj0/2xKqxD8VabgAt1Vv6dnBLJfShWlPN9aFVR6sMExtbGaXPM4M
   6IssrZkbix/OMCfGR1hrJyjmTmXC3Yz5rGdm5qyJbD9Iu/IyuqJjUINcS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373865152"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="373865152"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:38:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="836434185"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="836434185"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:38:48 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:38:48 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:38:48 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:38:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUMszz1rLl4wpoUPV1tjufWuSw4fBluSSiuaNysySmr80yX0HJwdX5a2JF65gQF/L+f3Vs8BMiyqKcme4OseoaqGMothK6EmESC8LS+WuocSQzDl/6NtVxIN6OPtWm8TYLqGTyx/Suu4uIpfYReeasbBf2KE8Rw9TK1bYG/3RMdkxvTIL9Ek4P3/E5FgdJ3W6Z/VRfcXEkM6afN21rj2LSDSvUcp7wudqSCS9U1vJ5Qy+l0zqnWyV8K0P7SwJaiBrIUZCwzLdyX4rkelTA3b75JM3IRvZ1nCpCZsVLG/gFAEg1VxLuj/X0jRmfd01cTF43T6xUGaVYM9w6LxJyp9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHQLLehY3ORFU4mkSwcHr+srLypi+F9Kim8V8k5ZOew=;
 b=WTqpM1BKeGDEOrRVO/KPI3XOJWAXRuRrS3gSGQyzV5XpBV4Sfqy09CgChyCg9KWnvWw3TCWsTHDbTKR+vpcRNcaI3K63yAJxLxRZlAcT6Ol7XNVZJBbP1OFFIUp2PS5DFGTWE0CBJ2FlGGuKcbOOCI/5yJL35eTt4A7mAPwVefQypgs4vrK1AmIqz8sDbhPVqgZymlMh1x+a26LwJ809lctK6yG55L0e1hFyZpGpG8YP5Il0dzgLDgWOeEomvpWGqaci3LC4qUlkW98eEQmSa8/KvECpk8t4W24QFP6koUrWGATvjGZS+K4CHAh13yk0ZcdJ3OYU5zlLqd2aRaLtYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:38:46 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:38:46 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [sudeep-holla:v6.7/ffa_integ_test 5/5]
 drivers/firmware/arm_ffa/test_driver.c: linux/arm_ffa.h is included more than
 once.
Thread-Topic: [sudeep-holla:v6.7/ffa_integ_test 5/5]
 drivers/firmware/arm_ffa/test_driver.c: linux/arm_ffa.h is included more than
 once.
Thread-Index: AQHaJFfsBR/cRNabMECNszFAWuKa6bCYbUfw
Date: Mon, 4 Dec 2023 02:38:46 +0000
Message-ID: <CY5PR11MB6392B9B84C3288ABC8EA92B3FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312012151.Dq5V6dqG-lkp@intel.com>
In-Reply-To: <202312012151.Dq5V6dqG-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CY5PR11MB6259:EE_
x-ms-office365-filtering-correlation-id: edaf6224-cf3d-483e-6dc0-08dbf472237b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mOTcBaOh8OyQLbKaLQQj3AynENPf4fqEiw52QTMXnSSoS3K4th6n64eE5yDGaYW/fcZhbk2jydRPDxJmJk4+Oc3vlgs6JgwzFnBYEEEPdPaH5I+YrQ1AOoycew4LQlb2DbKL8P2ZHJy02L724bUbM8op5z08zKGkEv51ypZ2LIveJ5j2btmqcJza79ev81j10ptuiIMk553JlPkan3IJu2llQeHQFJ7hJEeJB5soeCoJcv3WRhY0lJXWgYaIQZR0lDrumgBMTwtQhfDhzEr+Zz6UYRBpB9VPLNeYiWZXcpXYXG4O15MDWOuez8w8+RcmlO/XzV8qnTOlyu3BAAg/2EjlLkMpNcgh41XYIpIn3F89iyKIQ6RxuZR3CEPlIr1vlYh2Zb/2WcjnHD4eM2JMTWUKbnH3yNiyZ1yJg9SZCwibGV2MNKocTF/Ibd3BZ7tFP27XxriYL5I/gT0pH8Ks/G2HehGIh7V/3WyCUPIr7aAQUihZna9a39XOGSQw4dMUygz7LdkIimpZCEINhOF4s0cKMdPCCsYOfPHpyOSO8Q0nBSaY9hiecqttcs3igD1h/Yr2BeMPXa7A6zzcgd+Yy/F94YsqJkir3eVC7MTzvXzZBULsAaMHZqhzC233z+hwECwyfq8HbLUr8V067km9EScW2hTDIZDftrrBtCdiNwqvAFsqibY7ivO9Hev0bwcM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66446008)(64756008)(316002)(66476007)(8936002)(86362001)(8676002)(52536014)(66556008)(966005)(478600001)(110136005)(76116006)(66946007)(41300700001)(2906002)(5660300002)(33656002)(38070700009)(122000001)(26005)(9686003)(7696005)(6506007)(71200400001)(53546011)(83380400001)(82960400001)(38100700002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8/GfqbYlEI50welTL9JymiOquSlHvZNbwAE7AjZRNnl984K7OYflHv1RDsk4?=
 =?us-ascii?Q?YMPNtVUX2qgmHc8qKX3T/sAh2ErVdZCj48CwtdzVLxiKiMvCWU1Cm5wfwpzj?=
 =?us-ascii?Q?9X+nTSspgS2I4do5IBL2nkR7aPRva4FoCxAWsmo+4AiuOxNQDBcLHOiOCsLK?=
 =?us-ascii?Q?Qo5D7+lBy/Bj4m75/7KeKoKmgSh0qZfnjE1FNNoqN3ux0WSOup1mwh2pz4h2?=
 =?us-ascii?Q?5ldOZaBudezHFG9r/Q6phCKSPVqpHqjfoLBuUAG+u/PGS3B/W35RwjYQf1LI?=
 =?us-ascii?Q?/oBHxxc3xdvsby6axbtdb3ff17J1XOpDlS/2XIzbHf6U6STiKXLyxJjx2MF+?=
 =?us-ascii?Q?oBS3KwUnO2s0FRZ8yU1nWbd5CxwlTxJ0hFUqYsc6NpF21poXiId5VivWCsLs?=
 =?us-ascii?Q?6VkGbGmIZQIlvEMYHrtUYkrmHAlArG9oIlIvGzEEjSuPPAze4tKpcptESV7C?=
 =?us-ascii?Q?oTT5O5bggzqmedTu31IP+uS7/LHAa/hwCzJSxhbJZuvOn2c+DO90LOBuOzYK?=
 =?us-ascii?Q?pLQJGYov0FP7g14uIPsVsNY6/7rKxvJJdIjZ8Ra+kEyY8Qwp66a9ytV6X+mL?=
 =?us-ascii?Q?+flbKczd5ORHDoHyXHKSUcQOjX64yDYwsh7l9ANLYrLj+I3u+4gNvQ8QUmYv?=
 =?us-ascii?Q?97XyI8u3bZtu1HxfUl6cIgCeWl0P43pRtX6ldiWYlGOvpsnSXcTZ/an3uHEV?=
 =?us-ascii?Q?sBIovzLm2/87rYWh+j58a+n3ABTCwbJW+DT9VpADsbXptgQO6UdizEA42HLe?=
 =?us-ascii?Q?cr7BtKnYZjSV1Cy6EnCNcp7iHhITvjd0qfzwYDsbROMYUt6lq6cUJoLewzSw?=
 =?us-ascii?Q?1OJ/asd+MbnRdfdaI9Uda2A7ACHiV7wfWCprVhufDv8EcYBlzIWA0aWNu3md?=
 =?us-ascii?Q?cFygHiu6f87jxuzxu4K79SjUXRgzIqAn+hYa4TvfvJhot5kLMI6bPRhUOXSH?=
 =?us-ascii?Q?WvSvkwYgoqv43x3fwQ1QEGA1WT8WKmWIYUBMRJyCOHjLKttcSg6HN4GELb5a?=
 =?us-ascii?Q?PX6vgIXJZXUzJPhM7JAJRspu1fI4IO1yIRdL9zKaJde7CzTwl3yjQc6lEZ+q?=
 =?us-ascii?Q?EDXhKqNFaP23QLpju/c7piszbmaVtzKu+SgXcbJ7CGGylG3xSMjbGohE4eGs?=
 =?us-ascii?Q?ajiU28M/FSuZ8LCBG80JGlk5k8GspC2P418Z9+pLdqi9Mhx41HHgAvcsJ1VC?=
 =?us-ascii?Q?f5dVJAo3WSzjZaHiGlqLP6dJeua9VepQDLt0yZSch1MD1PrxHpnM5zqXmboJ?=
 =?us-ascii?Q?2rkvIqNO0Z1+ns5BuPgCqQ2RpfCM8Cnz6ukemi+zhr8TcCfKyz8qIMxqB9Su?=
 =?us-ascii?Q?bCFX6jk2l+tih8iRZpjGZDv9OGysnT4puQY/+Y/FUxMHHMWTRZ9AKpw+vPvm?=
 =?us-ascii?Q?Puw5aWegKX4jfSw282gFsl2lL26h0IIzQFV16BGsFbXVNRFGi4WvwiUX6Nc+?=
 =?us-ascii?Q?wxHo7cw6ihHphYTBwszDNA9MMpEZDkMgKvOoH/GF83E+DbxMHaQcS9jKWNGc?=
 =?us-ascii?Q?YMeezAWkhQXGrFxeP8BL/mGFkc/gtOSh6LgrXGMVTZoAGCDUMNDvWQZ/2hi0?=
 =?us-ascii?Q?cxJSgziZgdp4NQaTICOIy7gX5QYI7TQvJW64g9AU?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: edaf6224-cf3d-483e-6dc0-08dbf472237b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:38:46.1670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fx9lUWor2x9S8ID3i6x49XAACYrJqVdU52YE7VHRndzRPHoNLz7rEXs2S7rFkFFx5A/rMpuxuA4yFuC5iWziQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/all/202311110545.JOGoXeHY-lkp@intel.co=
m/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, December 1, 2023 21:09
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [sudeep-holla:v6.7/ffa_integ_test 5/5] drivers/firmware/arm_ffa/te=
st_driver.c: linux/arm_ffa.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.=
git v6.7/ffa_integ_test
head:   0dfce5abe57576c4804fc626172b0cd80a320c1c
commit: 0dfce5abe57576c4804fc626172b0cd80a320c1c [5/5] firmware: arm_ffa: A=
dd test driver
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312012151.D=
q5V6dqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312012151.Dq5V6dqG-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_ffa/test_driver.c: linux/arm_ffa.h is included more=
 than once.
>> drivers/firmware/arm_ffa/test_driver.c: linux/module.h is included more =
than once.

vim +6 drivers/firmware/arm_ffa/test_driver.c

   > 6	#include <linux/arm_ffa.h>
     7	#include <linux/module.h>
     8=09
     9	#define PRIMARY_UUID \
    10		UUID_INIT(0xb4b5671e, 0x4a90, 0x4fe1, 0xb8, 0x1f, 0xfb, 0x13, 0xda,=
 0xe1, 0xda, 0xcb)
    11	#define SECONDARY_UUID \
    12		UUID_INIT(0xd1582309, 0xf023, 0x47b9, 0x82, 0x7c, 0x44, 0x64, 0xf5,=
 0x57, 0x8f, 0xc8)
    13	#define TERTIARY_UUID \
    14		UUID_INIT(0x79b55c73, 0x1d8c, 0x44b9, 0x85, 0x93, 0x61, 0xe1, 0x77,=
 0x0a, 0xd8, 0xd2)
    15	#define IVY_UUID \
    16		UUID_INIT(0xeaba83d8, 0xbaaf, 0x4eaf, 0x81, 0x44, 0xf7, 0xfd, 0xcb,=
 0xe5, 0x44, 0xa7)
    17	#define TEST_UUID(x) \
    18		UUID_INIT(0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00, (x), =
0x00, 0x00, 0x00)
    19=09
    20=09
    21	#define SECURE_WORLD_PARTITION_MASK 0x8000
    22	#define CACTUS_ECHO_CMD 0x6563686fUL
    23	#define ECHO_VAL1 0xa0a0a0a0UL
    24	#define ECHO_VAL2 0xb0b0b0b0UL
    25	#define ECHO_VAL3 0xc0c0c0c0UL
    26=09
    27=09
    28	void test_ffa_notif_cb(int notification_id, void *data)
    29	{
    30		pr_info("%x %p\n", notification_id, data);
    31	}
    32=09
    33	static int ffa_test_driver_probe(struct ffa_device *ffa_dev)
    34	{
    35		int ret;
    36		struct ffa_send_direct_data data;
    37=09
    38	        pr_info("FF-A test module probed for part ID 0x%x\n", ffa_de=
v->vm_id);
    39=09
    40		data.data0 =3D CACTUS_ECHO_CMD;
    41		data.data1 =3D ECHO_VAL1;
    42		data.data2 =3D ffa_dev->vm_id;
    43		data.data3 =3D 0;
    44		data.data4 =3D 0;
    45=09
    46		ret =3D ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    47		pr_info("Ret %d\n", ret);
    48=09
    49		data.data0 =3D CACTUS_ECHO_CMD;
    50		data.data1 =3D ECHO_VAL2;
    51		data.data2 =3D ffa_dev->vm_id;
    52		data.data3 =3D 0;
    53		data.data4 =3D 0;
    54=09
    55		ret =3D ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    56		pr_info("Ret %d\n", ret);
    57=09
    58		data.data0 =3D CACTUS_ECHO_CMD;
    59		data.data1 =3D ECHO_VAL3;
    60		data.data2 =3D ffa_dev->vm_id;
    61		data.data3 =3D 0;
    62		data.data4 =3D 0;
    63=09
    64		ret =3D ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    65		pr_info("Ret %d\n", ret);
    66=09
    67		data.data0 =3D 0;
    68		data.data1 =3D 0;
    69		data.data2 =3D 0;
    70		data.data3 =3D 0;
    71		data.data4 =3D 0;
    72=09
    73		ret =3D ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    74		pr_info("Ret %d\n", ret);
    75=09
    76		data.data0 =3D 0;
    77		data.data1 =3D 1;
    78		data.data2 =3D 0;
    79		data.data3 =3D 0;
    80		data.data4 =3D 0;
    81=09
    82		ret =3D ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    83		pr_info("Ret %d\n", ret);
    84=09
    85		data.data0 =3D 0x736c656571;
    86		data.data1 =3D 0xc8;
    87		data.data2 =3D 0x8002;
    88		data.data3 =3D 0x1;
    89		data.data4 =3D 0;
    90=09
    91		ret =3D ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    92		pr_info("Ret %d\n", ret);
    93=09
    94		ret =3D ffa_dev->ops->notifier_ops->notify_request(ffa_dev, 0,
    95					&test_ffa_notif_cb, &data, BIT(0));
    96		pr_info("Ret %d\n", ret);
    97=09
    98		ret =3D ffa_dev->ops->notifier_ops->notify_request(ffa_dev, 0,
    99					&test_ffa_notif_cb, &data, BIT(1));
   100		pr_info("Ret %d\n", ret);
   101=09
   102		return 0;
   103	}
   104=09
   105	static const struct ffa_device_id test_ffa_device_id[] =3D {
   106		{ PRIMARY_UUID },
   107	//	{ SECONDARY_UUID },
   108	//	{ TERTIARY_UUID },
   109	//	{ IVY_UUID },
   110		{ TEST_UUID(0x3) },
   111		{ TEST_UUID(0x4) },
   112		{ TEST_UUID(0x5) },
   113		{ TEST_UUID(0x6) },
   114		{ TEST_UUID(0x7) },
   115		{ TEST_UUID(0x8) },
   116		{ TEST_UUID(0x9) },
   117		{ TEST_UUID(0x11) },
   118		{ TEST_UUID(0x12) },
   119	        { }
   120	};
   121=09
   122	static struct ffa_driver test_ffa_driver =3D {
   123	        .name =3D "test_ffa",
   124	        .probe =3D ffa_test_driver_probe,
   125	        .id_table =3D test_ffa_device_id,
   126	};
   127=09
   128	module_ffa_driver(test_ffa_driver);
   129=09
   130	MODULE_AUTHOR("Arm");
   131	MODULE_DESCRIPTION("PSA-FF-A test module");
   132	MODULE_LICENSE("GPL v2");
   133=09
   134	#if 0
 > 135	#include <linux/arm_ffa.h>
   136	#include <linux/device.h>
   137	#include <linux/kdev_t.h>
   138	#include <linux/of_address.h>
   139	#include <linux/of_platform.h>
   140	#include <linux/mm.h>
   141	#include <linux/module.h>
   142	#include <linux/mutex.h>
   143	#include <linux/scatterlist.h>
   144	#include <linux/slab.h>
   145	#include <linux/smp.h>
   146	#include <linux/uaccess.h>
   147=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

