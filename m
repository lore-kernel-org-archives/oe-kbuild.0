Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451C731578E;
	Mon, 18 May 2026 05:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779081072; cv=fail; b=QcsNHwoQ+JJKfQyAllucQISwWpJBoufjAqwy716g0VLy3MamKdR057uEZVcGAUC3corGjTLtW9BmiKXnU9480jXUPxpaI7ed8UhQKbFtlTgAIwJGViZZ8WVQNIQPGgrdWRy8FE9ZI+yZJwDb6CVXMBM+ISqCp472rrC7zN6g6r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779081072; c=relaxed/simple;
	bh=ht3fwjONc3dwKxH9Zw7G+n7dEnvIjlzMydFr2o6Ruhk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RdguAvgFukIY/HUrPUc2u9iKJ9fH5krmewBU3xCIU2tVhpj5y8rhPwBcps8JIVh6yZG7/cvHFdaavfasECBZNj4nWIdAZqsw49c/5xUHHXi6Pc68GXlciudCHBDr5Bn73KxSnUCyivfz4scezcwPOZC9vpacqHCUvbQ+nbM8Y7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5xJYTZ/; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5xJYTZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779081070; x=1810617070;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ht3fwjONc3dwKxH9Zw7G+n7dEnvIjlzMydFr2o6Ruhk=;
  b=G5xJYTZ/Dm9Ki1W2nc5Z6LRRnMndaT+DutzBqfHgTgS/McwJVXEibGt1
   +lUkf9uhd4WHBHJyZDctQj9xOT30LVbU080Q8X62dFnS5h3XYjaHTLpyU
   mkkmfSxmA4AprpuRQXTK6HN+3+DFREpBJlUj9SzV+p0nOUSHFXc0qrHYJ
   luyJ5NMot0oVzpPHUAkwFQdH37owjjJCF/vmIziqN+Vs2oGuelj57FOau
   ZIqi5UfryZvacjR0c4FxaywRxcNuGzDTy0MwjvkhGyX3P/8UhiaaybJ9q
   MEDLaHV7QoAwtFjkRKkklE+2YTZ4+b0zRq3b4dcOAgG5tvu0sVWpPtEBA
   A==;
X-CSE-ConnectionGUID: 5Ypd2/dATl66XmYpuxsQkA==
X-CSE-MsgGUID: JUsa1Cb/SVGuQlrNQVq+hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79957484"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79957484"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 22:11:09 -0700
X-CSE-ConnectionGUID: XqEFgNZJTYKdVpzTHc3L/A==
X-CSE-MsgGUID: hCCm/XYfTUycwXZ2wUMp1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="263078795"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 22:11:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 22:11:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 22:11:09 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 22:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZq0QqUbNk/g8nM24OlcUbsaMrhhIY+tfUkL++Q9gSpjZb6t8PVtYzrOSkc1r4PP9OciSYuAIv2XGWXuHUBXJtqCzbk5DGLFvImD71AsTpUJN/xJGuKPxwgfyhCMRiVxDIHRcmsoA6ricxkt1s1VZpJyrdzTJ61Q3dBTYmWEtBXt6vI0JfndSV0/7LGjTiAGQZ+BcpLsQKggX8ulh4g+1M8sqb+2IFrLKlqtxFVk+a4pA4WcLpmtc3UlFbyc4QqJuL15e4H0DAncLxBeRE7F0GpojFI0Dy1tnOzoDawbBJu3EPPriFnurmm4kQ2vlXpI/CwQwDNcK/RGGl6/OxjLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht3fwjONc3dwKxH9Zw7G+n7dEnvIjlzMydFr2o6Ruhk=;
 b=nzjJgGL92dhVlbG0qrt5hCpfPf0AZHnEcJHW6doazv5MIa/XPCfq68QeIup/8U1WQksKjtQQw1X2WUhAmYu1kXNva7a6PVj5m8ceSsijC+JWEGoY9gxugY8qC9XJSGaRLvkcbYgCsl5I7+a8hHYgrpEUiwJXffYXIjJjTAC7jKq+rOSLvGKa6AfQDiJfbh8BtRaUII6HDF9WECMkXg3S/lla/bGjBHqnWWJn7pXccAIUs4+HFTrGyQr4HuPYUCZ/DzvI4FkT3F7vJXCALADGVbHGMj8IBoP1/pShuqrSuRpZioHlV49z5E6chE24cXpJa4ee5rbpX2JH19bGgc86lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) by
 PH0PR11MB4805.namprd11.prod.outlook.com (2603:10b6:510:32::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.11; Mon, 18 May 2026 05:11:01 +0000
Received: from DS0PR11MB7880.namprd11.prod.outlook.com
 ([fe80::7485:4354:e91d:2]) by DS0PR11MB7880.namprd11.prod.outlook.com
 ([fe80::7485:4354:e91d:2%2]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 05:11:00 +0000
From: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
To: Dan Carpenter <error27@gmail.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
CC: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "Berg, Johannes" <johannes.berg@intel.com>
Subject: RE: [iwlwifi-next:next 13/93]
 drivers/net/wireless/intel/iwlwifi/mld/tx.c:571 iwl_mld_fill_tx_cmd() warn:
 variable dereferenced before check 'mld_sta' (see line 565)
Thread-Topic: [iwlwifi-next:next 13/93]
 drivers/net/wireless/intel/iwlwifi/mld/tx.c:571 iwl_mld_fill_tx_cmd() warn:
 variable dereferenced before check 'mld_sta' (see line 565)
Thread-Index: AQHc5oOz6w5fbXCKgUet0an7j8jQY7YTPAZQ
Date: Mon, 18 May 2026 05:11:00 +0000
Message-ID: <DS0PR11MB788062B175A1E6833DA8EC31A3032@DS0PR11MB7880.namprd11.prod.outlook.com>
References: <202605171045.6jPun4QF-lkp@intel.com>
In-Reply-To: <202605171045.6jPun4QF-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7880:EE_|PH0PR11MB4805:EE_
x-ms-office365-filtering-correlation-id: 4cf11c2d-7a29-4743-9e47-08deb49bda53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|11063799003|38070700021;
x-microsoft-antispam-message-info: Ho9jf3mvAhU3KW/kHvJj234gF3Clke94+3+7JubkiJiEHlEyXuoWVkBC2zDTifMmOWpr3RUUtCqPZJ4TZ3uNhyVn8fFBTP6DSgsH6nn6sDTEQvt4/v2aE3BAnTxsmNE4T9T4OqfUDCelN77CKFAqWnrDRemx7d3aUiRoV9ZyoCu9YkZKUiysubebNuqR8Sn+iycHkUkR1An/4+V5s1oCzNVbSx67ehTpuOdzADROq7kM+TVp+QGIwR/Oz7A/dnV7b8Xjyp466gNz//XBTw6CuVa9P+cgQ/VO/O3JM44coo9QhnCYFf28tPllMcC0gpY42lNibJ40XShmcyIlVmQRI2l8/NES+dsjvSHBCqlb6LO/aXEZVGSsNCFZJcHDi1FfYQl5eUqGD/UmVK6uqXONxnYQ7Rpt/PTY6uFuWOkc6+So2C5R7TZSFGkx86teBIW5MdNcTQjeD4muYueXPVfobIqk4hyHZY2BvrtcKKt4MUy1vPMTlVdF3vAGZ07hD70V31lehwlkew9W/MfzZypTpCdJRO42M8XapuuAohBbPZDDeVHf3fkrihnFQgKbpjCKAaULuMnJl6i9eG+EA9Q2tpBAVXnlypox5EFNshjzYMHGz+vBJckIc2peUGdwJUO/pYX8kMVcAswi/MCaDNSMkd+PQtAiW5mMB1o+usePEU9phTze2XKXqFmC12M9L34UY+P68KWgT/G5cQhenjdLHac5EKQT7PAnEm0wNRkBpm3ma2zmR5Dd4qnZ0CfPF6Qw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7880.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(11063799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blNXRWgzQXZUNkpqcUVOR1lzTVMxUXVqNzBVSnczUGtBdmFuOWpTeGZsYXVp?=
 =?utf-8?B?OVRieTNwVDRZMk1zb1FqRll2OU93VDI3WXpzZFBwSkhlYUtWMUVJSG9kQXlw?=
 =?utf-8?B?eS9vVDJTYTdIajZHQzFpeXZwV3U5VEZKNndBZkVmMVViM3RKQUM5ZlpVYkQ3?=
 =?utf-8?B?cFJMNy9TZHN6c3YxUXpiREJSeHZkTzdTQm8yQklOby8vS3dYWGs3NkV5VmpZ?=
 =?utf-8?B?OUxpbnpjZ09wWWdLelVxRlV5b05JOGJWQ2dxb1l4b0Q3SUhPZjVTSVA4dWcz?=
 =?utf-8?B?MGxCWGFTaEd0bEc5RTAvUGVaYlFYcGloL0I1Q3J0K3BmUG9pMGhpSE9aZHZr?=
 =?utf-8?B?RTlCbGMzb0NkUzBKSk9YcWJJeDhKR1FRY3JrU0ROZFVXdWtXUWxoa0lpQnBm?=
 =?utf-8?B?NS91UEp1U0s3VHQ2M05lMUZaOU10RUIwYVhJWGhRT0gyQXRUTi8yTWh4S2JN?=
 =?utf-8?B?N09EYTUzOWtyUUtYQURyeHpVZVdpN3J6TEEvRlBvSmVuOXA2SGxOckwwU2Zv?=
 =?utf-8?B?N0FmUmdmbVJRQ2llelhnMXMwRlU1VU9xUVFKQTlVSlpqWmY1ZUdCT2NpbHlZ?=
 =?utf-8?B?azhqbHI0Tkp3c3RLcjR0eXBEdlpoRnhjRnRDRk1YdW0zQ2xKaTdHREVqR1Q5?=
 =?utf-8?B?Wm1UVFpPZVVZc3J1c3BxLzhFbm04NVZpSVBpSVd2T3JxWHJ2QkpiZlhFVUJu?=
 =?utf-8?B?bFluMUFRc29wSEV4ZGRtUklmN282dkdiNUVIU1FSNk0rVzErd3ladUpJaHhk?=
 =?utf-8?B?c0tESEJZRnN3UHhVT240VkpiMnlJU0dpUFk1M0hyOWkySHJEb1c0eUh1L2Y0?=
 =?utf-8?B?Qld1QllKK1dwUlU4cnAvMTJyOFYrWVZUY1JhaVZTSTNNSjdIekhVQlNvRVN1?=
 =?utf-8?B?RnI2RTl1a2NxdlFPSnQyVENhWEZwMVNiUGNNVWF6a2VjNjFuTXJwZXBMeGlh?=
 =?utf-8?B?RHRMWHNpU3hzRVgydEpRQnplYStRR1grYVZyT280Y2o3L1M0OUZTbDhPM2pW?=
 =?utf-8?B?SDNVZnB0dVpUc2xwZ1RJY09jMTVUd3JlNlBJNnNqWGlDNC9ZOEFaZzlBK1pu?=
 =?utf-8?B?bnBJaFphTDRkN0JkUmpJZGxyTWthd3AzU1hPcksyV2swTlJTUm1PZkM4Rmp4?=
 =?utf-8?B?Z2NOMWIwRG4vekR3RUY2bjZUdDlXL2xuYlduSUtBUjRUVjdSVDRQWHkzdU5Q?=
 =?utf-8?B?RmwzeE91YUlZUWdLQ1BaeXNvdnpBMUtHZWxMcDUrVnArcjMxTlFiU0Y1aGpJ?=
 =?utf-8?B?dnpWK0dNRnJuemdZUUVKS1RSTmZWNGl0MnpMSVB6WHIxOVMxam9qdEJ6Mkhh?=
 =?utf-8?B?Wk5xSVFEdmJNSkpsYVF5a3ZCeVA1aWJDR3Zjb0lrNitRM0h0enhYYzY4TWg0?=
 =?utf-8?B?TkpRalRRbTR5NVBWYlB4QWNQV2lrdzhFQWdsalhhaW1RUkNnNkRLTzhqQXB3?=
 =?utf-8?B?WlIwTUZQVkFWSWNrWXh0UzlDOEd0SXptMEpJdUE2VTZxcXJrQWNxd25ONk10?=
 =?utf-8?B?NkhkNTFFVEYrSHhSTHpnSWszUnpyNHVuc2JhT0sveXNxcEVsbXVlU0NZWWEw?=
 =?utf-8?B?cmdBNUFGaXFEejZhNWdmNDkrZ1RLZHhwZ3NpVkxGWExhMG4zQzdZdDVwU3dV?=
 =?utf-8?B?Q1BmOU52WFFXVUlybEtYSEk4dmtrdkxDbTAwMDJBYnQyS2xuWGtGSG5wRmtE?=
 =?utf-8?B?UWhzU2xDMm5yMkZNaFYveDA5Ym0wWGN2aHN0YkZxUWphQlRuK3NpekVVWGpQ?=
 =?utf-8?B?VmxBeTAzekNJeFRGakh2TDdxZ3M0L2hKTWZxQzlaSy9KRzVOdURQZHNid2hC?=
 =?utf-8?B?WjBXQjBXdzN3MTA4bmVFSFJZY1EvRXg1b1p0YjU4NUdvUHFxWjllc1Z5NTd5?=
 =?utf-8?B?cVNYRHdlbXFmS1RYYXhhOTVhZStmYzF0UlZZMkRxb1ZOanFPeHRVZ3FmNTV4?=
 =?utf-8?B?aXU2UkRMU3dVQ0NJdVdLVHBZRVZ1UUdQelAxcmpla0tjZnRVMTVZZ01EU2Ju?=
 =?utf-8?B?NnhPY1ZpZ1ZZeHR4MVdTamJVa1hVbW1tUmZNbG5mbXBLTmFoRUcwOGFQZGpp?=
 =?utf-8?B?VTlwY1pJTy9nZ2c0blQwM01RWXU5YVk4ZktHT3Q2dTgzYUZOR3p2VHJRbDFX?=
 =?utf-8?B?WERseVo3bXNmeUFlQTlDS2RJUnErYTQrcjFhMXhKdDM5U0h1YndnR2Y3MDJl?=
 =?utf-8?B?MExWcE1tS1l4RkpKN0lmMWVOOUpOTGY3aTNpNUIzeHdzWDRlcmxzenVJMnJm?=
 =?utf-8?B?K1ZkcmxsampxOEdnSER6a3ZDNDY4K2Z2Y1o5OU5OZTJOVUFOY0F4Q3Z4cWs0?=
 =?utf-8?B?RTcwVENXTExzUVlmVisyWHlWcVRxN2JweFg5OC91WDZqZzRWdnZjYmVUek8r?=
 =?utf-8?Q?GYJ7PfKeVq21bKQ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GwmrKJ9/chWm6oV4wgvrU+li7IIWY3hZLPywjySXHSsmuky+PW94W4y/3ttRMdVHan2QMYb4IePh81MN/mAifvYRRHEdKgiZk+uK6er3kqUI2C8kj3h3r+xyIM2ExlOc/qSrVUAlzPcfTGKCx65WrJ8guUWU5Pl/83ex2toXixr8Aq2wng1z4nnDG2pAoda71aa4eLSCpLuu013HG5mJXrIJYDoKwRX5bH3wbKN7eY9XTEi6szFm6A82ulJioVsebqsFk4ngV8sukLU5yl3IS/R9hITweVLsQzsmdmZZni4TYxZG12z7PAMPzX2RtykjyJo7gNzWA1id43bnIUmVkg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf11c2d-7a29-4743-9e47-08deb49bda53
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 05:11:00.8835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /1+Yh/4kQnNp5ymy/zUQF4+UiJ6VyJxDxkZhDHP2fN4SUUbFYcGNc35hqnLYsyAJtqSP9yFt34OhclA9+MFUOgoUjjZQ1sYjaNXgY54aeF52Q5+/DwB7nJp7xJOQC/ce
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4805
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuIENhcnBlbnRlciA8
ZXJyb3IyN0BnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWF5IDE4LCAyMDI2IDg6MDMgQU0N
Cj4gVG86IG9lLWtidWlsZEBsaXN0cy5saW51eC5kZXY7IEtvcmVuYmxpdCwgTWlyaWFtIFJhY2hl
bA0KPiA8bWlyaWFtLnJhY2hlbC5rb3JlbmJsaXRAaW50ZWwuY29tPg0KPiBDYzogbGtwIDxsa3BA
aW50ZWwuY29tPjsgb2Uta2J1aWxkLWFsbEBsaXN0cy5saW51eC5kZXY7IEJlcmcsIEpvaGFubmVz
DQo+IDxqb2hhbm5lcy5iZXJnQGludGVsLmNvbT4NCj4gU3ViamVjdDogW2l3bHdpZmktbmV4dDpu
ZXh0IDEzLzkzXSBkcml2ZXJzL25ldC93aXJlbGVzcy9pbnRlbC9pd2x3aWZpL21sZC90eC5jOjU3
MQ0KPiBpd2xfbWxkX2ZpbGxfdHhfY21kKCkgd2FybjogdmFyaWFibGUgZGVyZWZlcmVuY2VkIGJl
Zm9yZSBjaGVjayAnbWxkX3N0YScgKHNlZQ0KPiBsaW5lIDU2NSkNCj4gDQo+IHRyZWU6ICAgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvaXdsd2lmaS9pd2x3
aWZpLW5leHQuZ2l0DQo+IG5leHQNCj4gaGVhZDogICBjZTJiNjQ1YmIzMDk5ZWY0ZDk2NzU5MzM1
MjcxZTI1ODc1MjAyY2U5DQo+IGNvbW1pdDogZDc1MWM5NDQwNTVhZWRmMzNhNmNhYjliMWNhZGFh
YjY1ZDdiYzhkZCBbMTMvOTNdIHdpZmk6IGl3bHdpZmk6DQo+IG1sZDogdXNlIGhvc3QgcmF0ZSBm
b3IgTkFOIG1hbmFnZW1lbnQgZnJhbWVzDQo+IGNvbmZpZzogaTM4Ni1yYW5kY29uZmlnLTE0MS0y
MDI2MDUxNyAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS0NCj4gY2kvYXJjaGl2ZS8yMDI2
MDUxNy8yMDI2MDUxNzEwNDUuNmpQdW40UUYtbGtwQGludGVsLmNvbS9jb25maWcpDQo+IGNvbXBp
bGVyOiBjbGFuZyB2ZXJzaW9uIDIwLjEuOCAoaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1w
cm9qZWN0DQo+IDg3ZjAyMjdjYjYwMTQ3YTI2YTFlZWI0ZmIwNmUzYjUwNWU5YzcyNjEpDQo+IHNt
YXRjaDogdjAuNS4wLTkxODUtZ2JjYzU4YjljDQo+IA0KPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBp
biBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9m
IHRoZQ0KPiBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MNCj4g
fCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+IHwgUmVw
b3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGVycm9yMjdAZ21haWwuY29tPg0KPiB8IENsb3Nlczog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDUxNzEwNDUuNmpQdW40UUYtbGtwQGludGVs
LmNvbS8NCj4gDQo+IHNtYXRjaCB3YXJuaW5nczoNCj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50
ZWwvaXdsd2lmaS9tbGQvdHguYzo1NzEgaXdsX21sZF9maWxsX3R4X2NtZCgpIHdhcm46DQo+IHZh
cmlhYmxlIGRlcmVmZXJlbmNlZCBiZWZvcmUgY2hlY2sgJ21sZF9zdGEnIChzZWUgbGluZSA1NjUp
DQo+IA0KPiB2aW0gKy9tbGRfc3RhICs1NzEgZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50ZWwvaXds
d2lmaS9tbGQvdHguYw0KPiANCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIwMjUt
MDItMTYgIDUzOCAgc3RhdGljIHZvaWQNCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0
IDIwMjUtMDItMTYgIDUzOSAgaXdsX21sZF9maWxsX3R4X2NtZChzdHJ1Y3QNCj4gaXdsX21sZCAq
bWxkLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLA0KPiBkMWU4NzllYzYwMGY5YjMgTWlyaSBLb3JlbmJs
aXQgMjAyNS0wMi0xNiAgNTQwICAJCSAgICBzdHJ1Y3QNCj4gaXdsX2RldmljZV90eF9jbWQgKmRl
dl90eF9jbWQsDQo+IGQxZTg3OWVjNjAwZjliMyBNaXJpIEtvcmVuYmxpdCAyMDI1LTAyLTE2ICA1
NDEgIAkJICAgIHN0cnVjdA0KPiBpZWVlODAyMTFfc3RhICpzdGEpDQo+IGQxZTg3OWVjNjAwZjli
MyBNaXJpIEtvcmVuYmxpdCAyMDI1LTAyLTE2ICA1NDIgIHsNCj4gZDFlODc5ZWM2MDBmOWIzIE1p
cmkgS29yZW5ibGl0IDIwMjUtMDItMTYgIDU0MyAgCXN0cnVjdA0KPiBpZWVlODAyMTFfdHhfaW5m
byAqaW5mbyA9IElFRUU4MDIxMV9TS0JfQ0Ioc2tiKTsNCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkg
S29yZW5ibGl0IDIwMjUtMDItMTYgIDU0NCAgCXN0cnVjdCBpZWVlODAyMTFfaGRyDQo+ICpoZHIg
PSAodm9pZCAqKXNrYi0+ZGF0YTsNCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIw
MjUtMDItMTYgIDU0NSAgCXN0cnVjdCBpd2xfbWxkX3N0YQ0KPiAqbWxkX3N0YSA9IHN0YSA/IGl3
bF9tbGRfc3RhX2Zyb21fbWFjODAyMTEoc3RhKSA6DQo+IGQxZTg3OWVjNjAwZjliMyBNaXJpIEtv
cmVuYmxpdCAyMDI1LTAyLTE2ICA1NDYNCj4gCQkgICAgTlVMTDsNCj4gMWM5N2M3M2NkYWIwYWZj
IE1pcmkgS29yZW5ibGl0IDIwMjUtMDUtMTEgIDU0NyAgCXN0cnVjdCBpd2xfdHhfY21kDQo+ICp0
eF9jbWQ7DQo+IGQxZTg3OWVjNjAwZjliMyBNaXJpIEtvcmVuYmxpdCAyMDI1LTAyLTE2ICA1NDgg
IAlib29sIGFtc2R1ID0NCj4gaWVlZTgwMjExX2lzX2RhdGFfcW9zKGhkci0+ZnJhbWVfY29udHJv
bCkgJiYNCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIwMjUtMDItMTYgIDU0OQ0K
PiAoKmllZWU4MDIxMV9nZXRfcW9zX2N0bChoZHIpICYNCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkg
S29yZW5ibGl0IDIwMjUtMDItMTYgIDU1MA0KPiBJRUVFODAyMTFfUU9TX0NUTF9BX01TRFVfUFJF
U0VOVCk7DQo+IGRhYmM4OGNiM2I3OGMwZCBKb2hhbm5lcyBCZXJnICAyMDI1LTA1LTA1ICA1NTEg
IAlfX2xlMzIgcmF0ZV9uX2ZsYWdzID0NCj4gMDsNCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29y
ZW5ibGl0IDIwMjUtMDItMTYgIDU1MiAgCXUxNiBmbGFncyA9IDA7DQo+IGQxZTg3OWVjNjAwZjli
MyBNaXJpIEtvcmVuYmxpdCAyMDI1LTAyLTE2ICA1NTMNCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkg
S29yZW5ibGl0IDIwMjUtMDItMTYgIDU1NCAgCWRldl90eF9jbWQtPmhkci5jbWQNCj4gPSBUWF9D
TUQ7DQo+IGQxZTg3OWVjNjAwZjliMyBNaXJpIEtvcmVuYmxpdCAyMDI1LTAyLTE2ICA1NTUNCj4g
ZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIwMjUtMDItMTYgIDU1NiAgCWlmICghaW5m
by0NCj4gPmNvbnRyb2wuaHdfa2V5KQ0KPiBkMWU4NzllYzYwMGY5YjMgTWlyaSBLb3JlbmJsaXQg
MjAyNS0wMi0xNiAgNTU3ICAJCWZsYWdzIHw9DQo+IElXTF9UWF9GTEFHU19FTkNSWVBUX0RJUzsN
Cj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIwMjUtMDItMTYgIDU1OA0KPiBkMWU4
NzllYzYwMGY5YjMgTWlyaSBLb3JlbmJsaXQgMjAyNS0wMi0xNiAgNTU5ICAJLyogRm9yIGRhdGEg
YW5kIG1nbXQNCj4gcGFja2V0cyByYXRlIGluZm8gY29tZXMgZnJvbSB0aGUgZncuDQo+IGQ3NTFj
OTQ0MDU1YWVkZiBNaXJpIEtvcmVuYmxpdCAyMDI2LTA1LTEwICA1NjAgIAkgKiBPbmx5IHNldA0K
PiByYXRlL2FudGVubmEgZm9yOg0KPiBkNzUxYzk0NDA1NWFlZGYgTWlyaSBLb3JlbmJsaXQgMjAy
Ni0wNS0xMCAgNTYxICAJICogLSBpbmplY3RlZCBmcmFtZXMNCj4gd2l0aCBmaXhlZCByYXRlLA0K
PiBkNzUxYzk0NDA1NWFlZGYgTWlyaSBLb3JlbmJsaXQgMjAyNi0wNS0xMCAgNTYyICAJICogLSB3
aGVuIG5vIHN0YSBpcw0KPiBnaXZlbi4NCj4gZDc1MWM5NDQwNTVhZWRmIE1pcmkgS29yZW5ibGl0
IDIwMjYtMDUtMTAgIDU2MyAgCSAqIC0gZnJhbWVzIHRoYXQgYXJlDQo+IHNlbnQgdG8gYW4gTk1J
IHN0YSwgd2hpY2ggaXMgb25seSB1c2VkIGZvciBtYW5hZ2VtZW50Lg0KPiBkMWU4NzllYzYwMGY5
YjMgTWlyaSBLb3JlbmJsaXQgMjAyNS0wMi0xNiAgNTY0ICAJICovDQo+IGQ3NTFjOTQ0MDU1YWVk
ZiBNaXJpIEtvcmVuYmxpdCAyMDI2LTA1LTEwIEA1NjUgIAlpZiAodW5saWtlbHkoIXN0YSB8fA0K
PiBtbGRfc3RhLT52aWYtPnR5cGUgPT0gTkw4MDIxMV9JRlRZUEVfTkFOIHx8DQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eIERlcmVmZXJlbmNlDQoNCg0KVGhpcyBpcyBu
b3QgYSByZWFsIGlzc3VlIGJlY2F1c2UgKHN0YSAhPSBOVUxMKSAtPiAobWxkX3N0YSAhPSBOVUxM
KQ0KDQo+IA0KPiBkMWU4NzllYzYwMGY5YjMgTWlyaSBLb3JlbmJsaXQgMjAyNS0wMi0xNiAgNTY2
ICAJCSAgICAgaW5mby0NCj4gPmNvbnRyb2wuZmxhZ3MgJiBJRUVFODAyMTFfVFhfQ1RSTF9SQVRF
X0lOSkVDVCkpIHsNCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIwMjUtMDItMTYg
IDU2NyAgCQlmbGFncyB8PQ0KPiBJV0xfVFhfRkxBR1NfQ01EX1JBVEU7DQo+IGQxZTg3OWVjNjAw
ZjliMyBNaXJpIEtvcmVuYmxpdCAyMDI1LTAyLTE2ICA1NjggIAkJcmF0ZV9uX2ZsYWdzID0NCj4g
aXdsX21sZF9nZXRfdHhfcmF0ZV9uX2ZsYWdzKG1sZCwgaW5mbywgc3RhLA0KPiBkMWU4NzllYzYw
MGY5YjMgTWlyaSBLb3JlbmJsaXQgMjAyNS0wMi0xNiAgNTY5DQo+IAkJCQkgICBoZHItPmZyYW1l
X2NvbnRyb2wpOw0KPiBkMWU4NzllYzYwMGY5YjMgTWlyaSBLb3JlbmJsaXQgMjAyNS0wMi0xNiAg
NTcwICAJfSBlbHNlIGlmDQo+ICghaWVlZTgwMjExX2lzX2RhdGEoaGRyLT5mcmFtZV9jb250cm9s
KSB8fA0KPiBkMWU4NzllYzYwMGY5YjMgTWlyaSBLb3JlbmJsaXQgMjAyNS0wMi0xNiBANTcxICAJ
CSAgIChtbGRfc3RhICYmDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXiBDaGVja2VkIHRvbyBsYXRlLg0K
PiANCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIwMjUtMDItMTYgIDU3MiAgCQkg
ICAgbWxkX3N0YS0NCj4gPnN0YV9zdGF0ZSA8IElFRUU4MDIxMV9TVEFfQVVUSE9SSVpFRCkpIHsN
Cj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIwMjUtMDItMTYgIDU3MyAgCQkvKiBU
aGVzZSBhcmUNCj4gaW1wb3J0YW50IGZyYW1lcyAqLw0KPiBkMWU4NzllYzYwMGY5YjMgTWlyaSBL
b3JlbmJsaXQgMjAyNS0wMi0xNiAgNTc0ICAJCWZsYWdzIHw9DQo+IElXTF9UWF9GTEFHU19ISUdI
X1BSSTsNCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIwMjUtMDItMTYgIDU3NSAg
CX0NCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIwMjUtMDItMTYgIDU3Ng0KPiBk
MWU4NzllYzYwMGY5YjMgTWlyaSBLb3JlbmJsaXQgMjAyNS0wMi0xNiAgNTc3ICAJdHhfY21kID0g
KHZvaWQNCj4gKilkZXZfdHhfY21kLT5wYXlsb2FkOw0KPiBkMWU4NzllYzYwMGY5YjMgTWlyaSBL
b3JlbmJsaXQgMjAyNS0wMi0xNiAgNTc4DQo+IGQxZTg3OWVjNjAwZjliMyBNaXJpIEtvcmVuYmxp
dCAyMDI1LTAyLTE2ICA1NzkNCj4gCWl3bF9tbGRfZmlsbF90eF9jbWRfaGRyKHR4X2NtZCwgc2ti
LCBhbXNkdSk7DQo+IGQxZTg3OWVjNjAwZjliMyBNaXJpIEtvcmVuYmxpdCAyMDI1LTAyLTE2ICA1
ODANCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIwMjUtMDItMTYgIDU4MSAgCXR4
X2NtZC0NCj4gPm9mZmxvYWRfYXNzaXN0ID0gaXdsX21sZF9nZXRfb2ZmbG9hZF9hc3Npc3Qoc2ti
LCBhbXNkdSk7DQo+IGQxZTg3OWVjNjAwZjliMyBNaXJpIEtvcmVuYmxpdCAyMDI1LTAyLTE2ICA1
ODINCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIwMjUtMDItMTYgIDU4MyAgCS8q
IFRvdGFsICMgYnl0ZXMgdG8gYmUNCj4gdHJhbnNtaXR0ZWQgKi8NCj4gZDFlODc5ZWM2MDBmOWIz
IE1pcmkgS29yZW5ibGl0IDIwMjUtMDItMTYgIDU4NCAgCXR4X2NtZC0+bGVuID0NCj4gY3B1X3Rv
X2xlMTYoKHUxNilza2ItPmxlbik7DQo+IGQxZTg3OWVjNjAwZjliMyBNaXJpIEtvcmVuYmxpdCAy
MDI1LTAyLTE2ICA1ODUNCj4gZDFlODc5ZWM2MDBmOWIzIE1pcmkgS29yZW5ibGl0IDIwMjUtMDIt
MTYgIDU4NiAgCXR4X2NtZC0+ZmxhZ3MgPQ0KPiBjcHVfdG9fbGUxNihmbGFncyk7DQo+IGQxZTg3
OWVjNjAwZjliMyBNaXJpIEtvcmVuYmxpdCAyMDI1LTAyLTE2ICA1ODcNCj4gZGFiYzg4Y2IzYjc4
YzBkIEpvaGFubmVzIEJlcmcgIDIwMjUtMDUtMDUgIDU4OCAgCXR4X2NtZC0+cmF0ZV9uX2ZsYWdz
DQo+ID0gcmF0ZV9uX2ZsYWdzOw0KPiBkMWU4NzllYzYwMGY5YjMgTWlyaSBLb3JlbmJsaXQgMjAy
NS0wMi0xNiAgNTg5ICB9DQo+IA0KPiAtLQ0KPiAwLURBWSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNl
DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMvd2lraQ0KDQo=
