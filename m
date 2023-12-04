Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E870D38A
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d01dHPoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701657479; x=1733193479;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GPGSNEY0eI1i2OKPVVZFKBDZNoIHjf2U+Unp0iRqwag=;
  b=d01dHPoiEso3CNUYe/ctQH4Ku2ChpwSpbpcSPmNfef7jy4fVqcrqF4Sb
   47PmijDpb1ryb+FkB4la61c6VKYyAN0MjOFZGpUVXxZOyK0fr5sFPS10e
   3llPRzR2pGimmXQmT7vbrI0jwUC4Cclswl6zxKbFoF0C+qXhbyYC84F82
   EK3dEBYJMcQd+r3RdJL7ivU9tPJlROBNpjlLQTDP6KRqJYbk2lPlBcQ62
   EVPpdThNCJaqf/+jHLdOiadmSUdPrETmr+orWzyQ6B6IcKaWSDrIRFX1Q
   Wzh5i1Jzct79EeaJq3tfLoJFwhePnuWAuQqQj+4tXK7B7jI4CaNu9rxfs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373865077"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="373865077"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:37:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="836434037"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="836434037"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:37:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:37:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:37:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:37:57 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:37:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dklYFSFPwSCxU5FAE5bY1vW/zfrE0ik1QjNONCL+xgtAbBSLA5Fvi7kBOAd13FmYLKfhyA7qfRCc65FMwGM04O0l7aN5+mUo160BvwS8X5+zGeyDYFzw1oydpP/EtCTNofrq49LSqzIBCxTbN/Twuavk1U05V7itQn6qne6ykihiezNH+vXEx08tdrc6PwUUlpU1kL/jB+yp9BFHwcnBqESGoGiy9SDoiVbSrF2S8ClQxfeLcDe9+yYSJlrr4X8DSNGDQpgvVPzQShRyL0IEqQKxPr9Jq4xjLU9zfD4Bq1pNKplBV0ze9XXMQEZzedq4w3SQpPCdODazr0ArEtNMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuzOj5ad72ElKhUiGyjM6bRZBeP8PiqAER8Vjs/UihE=;
 b=AdEItQNDXC9Wbay3cu+3+kq7XRGxxBRTff0SxgMwqQPo4qNN/7ipp5xdWBA6pcsHu4qKoId/Fo9PnyL4jY36t25R4Sb+mDUw+I61fXVHC3A31yoWPda8+pPn8PoVkaBjIdmHORvLlmGVj7P7UT50+25vHsHZ6Jt5kLwdZu7YtDMy6ZACz3EGF2jcV7HiWvoyJOLGlNCEimQ6BrqYaaKeB6GrxBy6mbplNyg68k9+tSqYTiA5kjRgVzdtYMeN4gewsYqmrFWR7FoVf+wAeFUgykdCmhX9+bX9EOiDC5UpaLNT70VePbBO28CjaGaKogZdNPw4rG/wPqRQL0BJwRvP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:37:55 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:37:55 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH 04/35] blk-crypto: add a process bio callback
Thread-Topic: [PATCH 04/35] blk-crypto: add a process bio callback
Thread-Index: AQHaJGs0G9YlG233b06Y5W7CyIQqHbCYbL+Q
Date: Mon, 4 Dec 2023 02:37:55 +0000
Message-ID: <CY5PR11MB6392D40BE1DB97A8518FBCE5FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312012352.qjTdmkYN-lkp@intel.com>
In-Reply-To: <202312012352.qjTdmkYN-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CY5PR11MB6259:EE_
x-ms-office365-filtering-correlation-id: e6083506-7b72-46f2-514b-08dbf472052f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sll1gFa8ySwvoiPSNJIUad1Kd8ThoUjLBVfWTdyJG7EqME1seTsbd3ZR9OluO0NaneE8RpyBMVkrCr11tQLYhq6//WYh4vETBMvsfUtV/bKfxvg+eXmB7v5iCP8rC1p+bzuVPq0JPGwXlSrJ2DeOeF18YJv1bkFsT6hi9VRHD61Immqj4Tc5R/ilMkBebiZOHUDvEbVjzWyP0Ep7XwlCtu9luisqLzgF2+MHRmazu+6EqlXHL/I7kqGOyRljRVVimpVRvoyINjN4rrWoW/81m/DXlFlbXnLhMw37Ykm5JHlktB4l2t++bXPq2LJkDdVyXo3KIEor8Xf7YDbxQPIsLQP5jS/C2dBlnU+kx5s+muFa/nIMyg82Gf7jh3I0w7WE0EJbtxtH23K+2UkcIWTsM2r0EHI6Uy4offN2lUw+2DDtvPKUotBXaJtvsAVuhJSPy/AUOl0Wx/gcW0dKw6CbXI0ufJvhN2ZbPnBFRK4v0GXhZ7OYcDyuUeS33tJIhKzBiIN2/UueWp+Q3U5fYsPpg3HSirtvL9ig4K2UmTqmsseYyGBYYfqlVZ2QpQO0cTg4RZcmEHPW051qEPOXE1Bu515zIv/+WtFnlwxbc2JSBJS3F2mHaaLGIezQcKdt6Xoc1U7Sla7ud02clys9fXoVcmn41MKsDMryRy1aI1IACi9Iu3QALG88HCEctCm/clO9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66446008)(64756008)(316002)(66476007)(8936002)(86362001)(8676002)(52536014)(66556008)(966005)(478600001)(110136005)(76116006)(66946007)(41300700001)(2906002)(5660300002)(33656002)(38070700009)(122000001)(26005)(9686003)(7696005)(6506007)(71200400001)(53546011)(83380400001)(82960400001)(38100700002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9HXDrur5a5XTkjkJ3fkqYHvYDwhrRIOBO8aNM3VZQEcH1jRzy/RNLEUM+zcQ?=
 =?us-ascii?Q?ghyAFWuW1sbXGg5hgAASN74l5fZeWuJbsmvxVVOh63I55A0FS/4N+awYKoxe?=
 =?us-ascii?Q?Qv6G4uTdy6S8srSaGvek+dBBA7gtNWHfECDaIJLKQIrcdTdA3dV+3jOFr8Ej?=
 =?us-ascii?Q?VUbIjL91rvIk+Ny7Et4mjllqUazD8uDC/6vjUaVMTcdqN/MwMKsyrZTjHBlv?=
 =?us-ascii?Q?BZOuiaio3yeYRqn3Ar9Knhh7dBw8sLjIuzOv2rWCyvLMzHq5/MMxS5a+HCwD?=
 =?us-ascii?Q?YLxVoS+aTXjDEXWxZkrDQplvZj4FYEBwlc33M3AVwbeghlNbiyp490su4tuG?=
 =?us-ascii?Q?r2+fIw6xC291tN8dQtxKQ2y1grUVSNR88HS9N3LyfKmiEaho+SloeD5D4JPv?=
 =?us-ascii?Q?3/KhcionlTmneKLrYQL3mQg4WpYc86kn4OFpIDe6tUAwRnyeYaFroVJlnE3e?=
 =?us-ascii?Q?dGgdDVYIdmOmXzXOL244a+QsAC+C0vam/yhP4npiCQT9aAqMhjydO6FesZGA?=
 =?us-ascii?Q?NSrorLGuv7hLz4j2zGrQmu7rofFK1aWjjEF/yJTiIuXQZ7Q5loST9pOBQGCr?=
 =?us-ascii?Q?Z16UeptF6aeuTAGIMv32uDcKYovzDaovGHjNoF8SQXLv7OheGCYXWloyBRUn?=
 =?us-ascii?Q?k8Np+E8DrnkhUngc0Il//FjZOEQByzM1PzR0scQjWC/UASSsDoEPWdxGoMgN?=
 =?us-ascii?Q?RU1Ecg27zobzFL6QxUnoAq/Ijts8mDUMJGKGojAh/tqGGcCeKBDvdyS4auzz?=
 =?us-ascii?Q?23DJUssjSgIZgKRJF7KuFc5/SDx9bdpB63qaMW+5Soj9N5CT7NTY/xHc2eXz?=
 =?us-ascii?Q?vJuJAF5tjB3lqSasREaK4yoMapVXAGhEhsvqqyf/QYKk5Wr0IHSW044fOMt2?=
 =?us-ascii?Q?qNKByNyoOoe+a7me5hGFUkPkSs7gxSZCdGNWEzuRXe7xHQLBXXTMSbZPSCHl?=
 =?us-ascii?Q?qZwRHuFPaEix+I9IFHnC2AReX4BLfi7lfx3DqhhjqvZI+s+8cAT1OJOGTRMg?=
 =?us-ascii?Q?4mb5rbNLPmhMVgmbroi39Rcxu6Oo64nRLgQRnTz84CdfoMj+1VayBk0lsFev?=
 =?us-ascii?Q?YQ2Hzw38cvR3oNCsTBIaM1N5KdD5pNRYxMU7gWogGrgMARajaV8+JcXDuZ/Y?=
 =?us-ascii?Q?aPcQ9GNhwfn9cC7YlB2MIiRzzVePNzuPJz6Wp6pZKBvthk6p4DkIi8yY1daW?=
 =?us-ascii?Q?vcHkS6ihoDmIJgXl6ouWuiKpGXoYAvF6Vb74QJsycDLKGUs1dsRuGgONy3vz?=
 =?us-ascii?Q?6ifR06zQB8ued1k0KvvGRJGSV/zf+eOcvrjQ1raEFVSI+CDARSR22OOSGsyD?=
 =?us-ascii?Q?zbLneW9lMIO2tnyEPaYTnHlWDyTs0nJYvLp4L3lvAhNySvWC7JoDXLDnJIGV?=
 =?us-ascii?Q?1rKR5t8yg1Zxn2JHPsYOIbzEOD9O9M+q/+AzhCW8zXQLMcgDArdBJ3hAe0An?=
 =?us-ascii?Q?+hvTOMsYssjcM6hu0mp71Cx4S5w515heLnZzuQfkl5dtjvHx9/6g1UFv5zFP?=
 =?us-ascii?Q?ruYAE3sYAICiRYSIxIv9tU1sXYLz5FXpr7EXzSTt3vDQBTxu0wuQdKW5N+yH?=
 =?us-ascii?Q?yhywruGtR5qVwiPqMVb29h8PQ5anJHR9/pxZ/6FZ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e6083506-7b72-46f2-514b-08dbf472052f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:37:55.2915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K3xYSlopnGl6RP3apS02h3OiFbkrjLZ8zucA80+dRlPZC+yRP6gDSeF9DX3oyQnle/oAsloYE0k87Nb15IqR5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-OriginatorOrg: intel.com

not_report

9 weeks ago patch.

Date: Tue, 26 Sep 2023 14:01:30 -0400

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, December 1, 2023 23:23
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH 04/35] blk-crypto: add a process bio callback

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <78be341377e7f0fb0ead3d5167be44ca0c87a944.1695750478.git.josef=
@toxicpanda.com>
References: <78be341377e7f0fb0ead3d5167be44ca0c87a944.1695750478.git.josef@=
toxicpanda.com>
TO: Josef Bacik <josef@toxicpanda.com>
TO: linux-btrfs@vger.kernel.org
TO: kernel-team@fb.com
TO: ebiggers@kernel.org
TO: linux-fscrypt@vger.kernel.org
TO: ngompa13@gmail.com

Hi Josef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[cannot apply to axboe-block/for-next linus/master v6.7-rc3 next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/fscrypt-=
rename-fscrypt_info-fscrypt_inode_info/20230927-020531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
patch link:    https://lore.kernel.org/r/78be341377e7f0fb0ead3d5167be44ca0c=
87a944.1695750478.git.josef%40toxicpanda.com
patch subject: [PATCH 04/35] blk-crypto: add a process bio callback
:::::: branch date: 9 weeks ago
:::::: commit date: 9 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312012352.q=
jTdmkYN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312012352.qjTdmkYN-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/blk-crypto.h: linux/blk_types.h is included more than once=
.

vim +9 include/linux/blk-crypto.h

     8=09
   > 9	#include <linux/blk_types.h>
    10=09
    11	enum blk_crypto_mode_num {
    12		BLK_ENCRYPTION_MODE_INVALID,
    13		BLK_ENCRYPTION_MODE_AES_256_XTS,
    14		BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV,
    15		BLK_ENCRYPTION_MODE_ADIANTUM,
    16		BLK_ENCRYPTION_MODE_SM4_XTS,
    17		BLK_ENCRYPTION_MODE_MAX,
    18	};
    19=09
    20	typedef blk_status_t (blk_crypto_process_bio_t)(struct bio *orig_bio=
,
    21							struct bio *enc_bio);
    22=09
    23	#define BLK_CRYPTO_MAX_KEY_SIZE		64
    24	/**
    25	 * struct blk_crypto_config - an inline encryption key's crypto conf=
iguration
    26	 * @crypto_mode: encryption algorithm this key is for
    27	 * @data_unit_size: the data unit size for all encryption/decryption=
s with this
    28	 *	key.  This is the size in bytes of each individual plaintext and
    29	 *	ciphertext.  This is always a power of 2.  It might be e.g. the
    30	 *	filesystem block size or the disk sector size.
    31	 * @dun_bytes: the maximum number of bytes of DUN used when using th=
is key
    32	 */
    33	struct blk_crypto_config {
    34		enum blk_crypto_mode_num crypto_mode;
    35		unsigned int data_unit_size;
    36		unsigned int dun_bytes;
    37		blk_crypto_process_bio_t *process_bio;
    38	};
    39=09
    40	/**
    41	 * struct blk_crypto_key - an inline encryption key
    42	 * @crypto_cfg: the crypto configuration (like crypto_mode, key size=
) for this
    43	 *		key
    44	 * @data_unit_size_bits: log2 of data_unit_size
    45	 * @size: size of this key in bytes (determined by @crypto_cfg.crypt=
o_mode)
    46	 * @raw: the raw bytes of this key.  Only the first @size bytes are =
used.
    47	 *
    48	 * A blk_crypto_key is immutable once created, and many bios can ref=
erence it at
    49	 * the same time.  It must not be freed until all bios using it have=
 completed
    50	 * and it has been evicted from all devices on which it may have bee=
n used.
    51	 */
    52	struct blk_crypto_key {
    53		struct blk_crypto_config crypto_cfg;
    54		unsigned int data_unit_size_bits;
    55		unsigned int size;
    56		u8 raw[BLK_CRYPTO_MAX_KEY_SIZE];
    57	};
    58=09
    59	#define BLK_CRYPTO_MAX_IV_SIZE		32
    60	#define BLK_CRYPTO_DUN_ARRAY_SIZE	(BLK_CRYPTO_MAX_IV_SIZE / sizeof(u=
64))
    61=09
    62	/**
    63	 * struct bio_crypt_ctx - an inline encryption context
    64	 * @bc_key: the key, algorithm, and data unit size to use
    65	 * @bc_dun: the data unit number (starting IV) to use
    66	 *
    67	 * A bio_crypt_ctx specifies that the contents of the bio will be en=
crypted (for
    68	 * write requests) or decrypted (for read requests) inline by the st=
orage device
    69	 * or controller, or by the crypto API fallback.
    70	 */
    71	struct bio_crypt_ctx {
    72		const struct blk_crypto_key	*bc_key;
    73		u64				bc_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
    74	};
    75=09
  > 76	#include <linux/blk_types.h>
    77	#include <linux/blkdev.h>
    78=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

