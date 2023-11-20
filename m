Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20A420F1
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 05:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARA+tJC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700458263; x=1731994263;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=TyCMyqIV4F0qrQ94IH/QbRP92FOaMUeCFgN9uqelOx8=;
  b=ARA+tJC8h7XEDzlXyVShWaW+Dm4TVu+zwILyFrcLxxgP1yEMEN78AvlK
   ctwjU34E5+FYzAPKMsjbtAF7mP3FJPZrr8HC7jRfygT4aozzJN2nFZBwY
   iy0jDuSXpmcwdry8mrwMTQ2E5oqjJrM6Siqf7JR78voYMYE6B4Ji6hFoR
   7KVgUh7by0ehzhm1EB3i7wSiZ9WMIMpsv+WeahIYO9qK8EFQiSVHTqGde
   7gQ0qrQCszJ7leQeGOo2LsNXeRZnDm4/ZMVNDISjz1eMlFmxkVU8y3n5R
   83I9KN/NsqbLKE0BGssJ3yfvmC909boIHzzRFH2Wj7vubRpOOj8EDgB2+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="395484521"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="395484521"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 21:31:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="832166464"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="832166464"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Nov 2023 21:31:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 21:31:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 21:31:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 19 Nov 2023 21:31:01 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 19 Nov 2023 21:31:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FntsEeDiT96lpq0CNJfUHSMZinPCyzonlTO2q+zj82awI/YK+T/NVvC8FMLg31ZDhXg1dPFESZm5ZCLyl6qwEtkcDhZqsehnu6SGaAQNHZVPsY4TwuWf6eX9fmqRr1MaWcg0PT+i7Z5Zpzpl20MqyH6jVyGc/j27ZIITl6hFJkkKQYXBQkNNPksgRvM1CHcuLa3coFkOIrAEurAtnsazZRYxowJstFqszvEKpawewgUlarg6UbfwUNmMx9yMeCgKBJsAsNNl2yE2dknYy+dJWYCiaC04jtQB9VYh8UyFiu8g8FcwgpdXmbD4Y7QC1sN+ObbqQWlTK31GOo7GkuqxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ch1DS0Z7oPlRzD5tRl9YlXzt9sET3wLM7iO9x4vkbM=;
 b=F+oMELFVVmqVUPbBVokAcfqA9KsYaWuj9N5t1pXJSWtRBF8m2fPosuSBvmhWnpesOAPsJdBAkk1kFYlmMpC59gY1LMIkltL/RSFhtLzPkbe80OrfMHxng+OGjKfweMdFMjKSdW/mOtW72rKilvCuWccf3MAMWq/VXT2HfQP+Puknq8U4OWuxzwtaDdEr0NvmlFg2rSEt6R//Aah6hIzsJIIBsj72ZkdO1ehwiJiZqNngS0ipYe7wcVX/cjawb0fG5lWZ6LKSQT4E7L6UQ1pNB8sj1OgxKpOIOAvsvNF/RcNIVyHImd2EwpEGeSOI/X/ZHA+BbnPUxq5bQWj5XLPFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 05:30:59 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 05:30:59 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: undefined reference to `crc_ccitt'
Thread-Topic: undefined reference to `crc_ccitt'
Thread-Index: AQHaGsLzohL6auvztkyA7mHND92ie7CCr+cg
Date: Mon, 20 Nov 2023 05:30:59 +0000
Message-ID: <CY5PR11MB6392A9EEE01EC0F33680597FFBB4A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311191606.cYdy1kzK-lkp@intel.com>
In-Reply-To: <202311191606.cYdy1kzK-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DM3PR11MB8735:EE_
x-ms-office365-filtering-correlation-id: 1c98b794-4b9d-4e38-04fc-08dbe989e0c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VjLdjwu0xxyrAtlPUko7cnCtZUBZe31IgQzKsB02ktdGcY+MpvBMBUtZeKevvc8JclLMKgMQJgZiG4Nn7185ETJk+8+P+Y+R9LlMaCrGtAdjgRlBUpFEFB4dbO0IR49nwpqhgYu/nMmsYugoakoaS6EpWnW0f4N8pMOD2cxKLsx3gZjDkJbU0OHjCsHnk5g1dB9XZSgMgfVRvmdkxPifD6pOV8K12Mu+p4qSA7C7pU3AYtvY+hFvKZi53yBSnyiIZ1i1k3NYM4j0NdL2qa3njTSx8wTx9vaHpCWKNmHYNHZ7b3N2Tq2nEjRYEi/QlPGFMN/oG/nHhb7RXVZt916moYw8/5+Ke/OHyoBl4GM3mN/QaPS0/FIM+JTfBW/cmlML3xU0OiVq341fs2IdRfPP2SA1cvOOord3wPxEy6Kv4Dxt+AGwNJqKpw+iO3LXtGvDq7qqC0MGOg39RnhUhI0UwUOFOOi+6YZjj8cF4oduBriiSBJhusJF6ClutB9r2vNx+zrrYGbpm3piX29LbN6fqOXGx6VkWUWTHYZns2iYbyCcr8ccyH6YcyoNKuh6LNz6NxKF26HnjzsPe6iTNfR+XoE+lrhn4miIMFTaYbpjTstyhOkCKj36DSUxEsjrXLq8mxfkHOqd7fr+Nz3c9PUmsSHjS/n9GUsVt81DZJYKv4Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39850400004)(376002)(396003)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(110136005)(76116006)(122000001)(316002)(64756008)(66446008)(66556008)(66476007)(66946007)(82960400001)(478600001)(38070700009)(966005)(26005)(83380400001)(33656002)(53546011)(9686003)(71200400001)(7696005)(6506007)(38100700002)(86362001)(55016003)(2906002)(5660300002)(8936002)(41300700001)(8676002)(52536014)(81973001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ilXvhbj5Diet+tEVMErW/36DHxX5DJOlGVfdzmC65lAmtXCLtlAdZ6i9NjCt?=
 =?us-ascii?Q?CWWq0yybXTn4KKUM9c744Phd2OEu4vRhDLUZNxVjsXh49V4NHtUK6zdPNkv4?=
 =?us-ascii?Q?WYg/HwNVqYqEZQS+Z5UUohCx0uFbs3MdkiqVRrB5TtCOoR6U49cE7z1x4+F9?=
 =?us-ascii?Q?WX4sZhFRTx5GeGR+G4wWsw0jfd4Fgw2s5y+Xd8fDEPci3aKaDmL5owhDt4MA?=
 =?us-ascii?Q?4NihGWEVUicxT548GqTm72rCsxyN0+ONuq4YYnAGI2UByFVKOX/VFceRVRBJ?=
 =?us-ascii?Q?ns1bpUAwI4ODGAfYv+E9PsEV1qrh0DmGLo6DzcCpQoW4bEUuMmp7KC1Xy8T4?=
 =?us-ascii?Q?ljnPmC8VTcwLk4zP7A1rTqqdhwW0XIMRMI+sSNhPTUuLtliXN2NdCtKDyV10?=
 =?us-ascii?Q?Cy85wWr76ykQHjcwPmDeETFNTxg3YAkB1zecKhipTTWR6512IKFVy86TyCjs?=
 =?us-ascii?Q?LTXnl74gbipcoJP3xNw2DUFZSsc1tkXxyrGOyle4hoGzALXLXLigE3KuZcv9?=
 =?us-ascii?Q?RGz++AGgR40Qza10FYsYnyFY59BJiaPKXKa68GTEQx6cmbpIDbXqNrFqZfSg?=
 =?us-ascii?Q?PFlIVNMTrkKqry3quSKqAsIcNA88WKAh6V9EFlDcQDjtUn8puVklIJUz4Sus?=
 =?us-ascii?Q?K1AtXwIatSAChumvja4VLmuQd+AVvHcCcqgC3V8FTUVpH6Jmz1nF5ghMMGsX?=
 =?us-ascii?Q?37XtYWkGrDjz886bOe9nfKA3hoiXo0WE6fX+4/x4mbvtWB19xjjyLNgzLv95?=
 =?us-ascii?Q?rbEuEs1pEhG1QiJpWe+RXGEVMPAPl+z8DFEPjMbmCeDVcJPWrz3saIzjAhdO?=
 =?us-ascii?Q?ICe0jQduPq9DqUfPX3OCxtN1T5sedHOMoiDA1PH+mEmfnddipQKCpSVh1fz8?=
 =?us-ascii?Q?MWGL3AWAspZHqqiGDSU/ZWkUBExU6zTavIk/gDkWpqkxHWfGP/V7H59qVEWk?=
 =?us-ascii?Q?ldixZPO+v3eNiTayA7uFMjAAvnOn8sMRdSKdPU8LHRdrGAeRfyTNe3cEU68X?=
 =?us-ascii?Q?jrMQxVgBSCm7+S52sSATiAcnaHRrVj6g8yI2HzmhrS5BphHxT13mNAN4ttNu?=
 =?us-ascii?Q?giQSTbTRmV0eubKeia1EsJhicJ3SZGhvngQbbpGkxrBn/kQpDxEOyh5Uj89/?=
 =?us-ascii?Q?qYBRQUig8BE71OCQA9hiODavHO0wVg5V6r+Uo93Ghc0lGh3ffrcFIBICHg45?=
 =?us-ascii?Q?8VxWZ5d8+Ryl5DIgSQrGvAOk9SELyiAsQRLxIW7kBKtQ2meHOodxP56WoKj4?=
 =?us-ascii?Q?xaRcA90D9etYNeWhxbIHV+bF/QgCzbYxAc1ffY3O/olko1QlVq2JBr7Dk87T?=
 =?us-ascii?Q?Tpn7T9shupCxyNP4KgcMTYKhdwB/jgUaYqUrUImHtqX1Gb8n8rj2p39PHRRi?=
 =?us-ascii?Q?sbb6dYd5GauRBq01oKqrvHHLw3bdN1Wvw2cn99oBF/PNvYA9vifnQOfSaWPw?=
 =?us-ascii?Q?VTd3sT4SvS/+TJue/15s2BxXF3YR7UjXqdofq+C3wwJpzENCUW2uuBbeQaYM?=
 =?us-ascii?Q?AymV9wXqdKA9UlHDd1WT7EF5LdfuG4gKngyS3334Isi4XT4UrS/GUYGyw4DZ?=
 =?us-ascii?Q?m1Ffa71MwZ+kertrSYMca4o+bGGyzULv5nkFuTPq?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c98b794-4b9d-4e38-04fc-08dbe989e0c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 05:30:59.3583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZHfoy9N1bJvIY6XNp8J9wfoRuuDOFZdqTr8WNGhb+GfkUXL/aOjNKyZo0THPO93cS06OoQHXDkPyVAKKR7XJng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/r/202311100836.JBsBIf8t-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, November 19, 2023 16:30
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: undefined reference to `crc_ccitt'

::::::=20
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is lin=
us!"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ayush Singh <ayushdevel1325@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   037266a5f7239ead1530266f7d7af153d2a867fa
commit: ec558bbfea671ac020a6dc6be8bf8f0ee556cce0 greybus: Add BeaglePlay Li=
nux Driver
date:   3 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: parisc-randconfig-r132-20231119 (https://download.01.org/0day-ci/ar=
chive/20231119/202311191606.cYdy1kzK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311191606.c=
Ydy1kzK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311191606.cYdy1kzK-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/greybus/gb-beagleplay.o: in function `hdlc_tx_fra=
mes':
>> (.text+0x1e8): undefined reference to `crc_ccitt'
>> hppa-linux-ld: (.text+0x26c): undefined reference to `crc_ccitt'
   hppa-linux-ld: (.text+0x324): undefined reference to `crc_ccitt'
   hppa-linux-ld: drivers/greybus/gb-beagleplay.o: in function `gb_tty_rece=
ive':
   (.text+0x91c): undefined reference to `crc_ccitt'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

