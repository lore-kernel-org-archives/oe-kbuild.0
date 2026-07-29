Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F988342CB0;
	Wed, 29 Jul 2026 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321512; cv=fail; b=evbIWRgoiDXtixl57/BDRgmF3cfkRRLTjnP2ldCd40ECxUlCVDTXgQ3dLcVeH7dD0wkfoL1RMorUH/IsJ/JDYz4FwmtLZHKVHnPOM2hl3kUZ4UxWyWHYSX0YYYHJ22VgghGBKHHeRNCedEGm+WnrbqhrNPV+wocVYthEpJ7LdVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321512; c=relaxed/simple;
	bh=KcYsvaI6Qn1JkdKxurnTnozSPr7GF4eMb6LRvBG7Vko=;
	h=From:To:CC:Date:Message-ID:References:In-Reply-To:Content-Type:
	 MIME-Version:Subject; b=FVfX8lf11v9Z0HIe5pk46fP2e+zeX8VCHbUQFJNtazLQHduZyPw/Mq50Ts1+WpecQ0X5Zz1hGfR/tDNMmh4pBg7UfuXBUacVYs+ux1wqkw1PhuGrxJvccmCX615SLTxUo3gWL4YRjZkZ4MsDtRve5piq+7lgKF9f73Fmu6f+N7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jfgQ1IRH; dkim=fail (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aefcvbri reason="signature verification failed"; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jfgQ1IRH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aefcvbri"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7ggak1823312;
	Wed, 29 Jul 2026 05:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KcYsvaI6Qn1JkdKxurnTnozSPr7GF4eMb6LRvBG7V
	ko=; b=jfgQ1IRHe3Kj/caQwrY3MotkjEv+KJMYcGBsjvAk8UMr45NcrVgTA5vVp
	rHSEOA078qb0NIHGleNSWDQY5Nj3+MaEuie4p+Xn5xvWOr3fy71SGKwtAKEXifE9
	T4mhf/YrbU6xxTCSCO2fdAlTYjuflPrgtyvdaEfM7Kbo2IlT0ZQkiKPEzVrpn2B9
	c1CGWulAXWc2IhJfDw1PuiL2ZSEsEOK025Ad0Q7BdwQfUhwt2FLFWogX67Zl1YaE
	muWrQPn/sG2IKmWFr1g5EhdoVtgF8qhMWUzZtg+yCua0iM2kJdVcLloTlvtN81Cm
	B+Az3CnoZWHc/IVjiU85Z1ie1G2jQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011034.outbound.protection.outlook.com [52.101.62.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpvexqa50-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 05:38:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7ZxxnqFM73mEmPBJDOozyiXUefmsU3WVG2NMCvccnwMSgnCZDaSApr869uCwv1KbIBvDZWphCGsdtzXpC4G1DDv01qqnZaCmx2Db5QC+HeZa1y4m/r7aM/ID3/crj7DWrJANoLAyNCq/ouRusQkxImJhmLwq1/wDyHT7EmmG0YUUK7Q2lotWCCY5vYPBffwDJJ00Aterm6/qT2cvW63q3jOHspsjVBdNsWxJ95MIXML89CGufS0OZ7zVmSp3tXGSRop4iO/GEhh1AzO3WeOKNJ3N6fXQzgc1qKN4O5WHpdT601E41UYRMUM+u33eIEqbzJh4IYhGhpLa7MeYKk8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcYsvaI6Qn1JkdKxurnTnozSPr7GF4eMb6LRvBG7Vko=;
 b=fn8+zVbQ0Yr054ZVlciqMY9E0T5oaQWRHJjJXFMXAYxgby77RyRN3KLZjdtAfoz82PSL35QXDKmvuZdc/jWEl89VqduVBD6cRTnPqcVHJTj7XwTQe28Mvot23vjAjowa+cV+TGS1w9KW5ldk6oDGRO3JZTSQna9gznlEyvNXRAnewcfNqSbG+o4mOzojN44baS1pHMoh5XoYZJnWwpHqsCHU1zVJA2wlX/rW2hI/eBMEZGke0EKGJySxA5eMl1+y8/0bGd2iZfoddTf/8x7/eO1ocf7bi6uFbXDUMD6Hk8vIQqngt06PRP3vqiKm7Hn5DNqjcECqg+V/aGbGJP96ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcYsvaI6Qn1JkdKxurnTnozSPr7GF4eMb6LRvBG7Vko=;
 b=aefcvbriDDNRz7zmbx+Lbsh4KtOBUcYZ57bwBW6hu4Gjh09SNbDq2IWexuiS8p4Gbdjl1DDERH2F/31SraIQRDJGhosHRLjp/h5lenaUWtkZFP4z5gDqWMBxnFZFbIsEGiUMHoOdy3YXFVOyplOFNuIwpV3Ay6JDHRYYJIq3roo=
Received: from BL1PR13CA0412.namprd13.prod.outlook.com (2603:10b6:208:2c2::27)
 by PH5PR10MB997756.namprd10.prod.outlook.com (2603:10b6:510:39e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 10:38:19 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::5c) by BL1PR13CA0412.outlook.office365.com
 (2603:10b6:208:2c2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 10:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 10:38:19 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 05:38:17 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 05:38:17 -0500
Received: from DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf]) by
 DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf%14]) with mapi id
 15.02.2562.037; Wed, 29 Jul 2026 05:38:17 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Dan Carpenter <error27@gmail.com>
CC: "lkp@intel.com" <lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis
 Bossart <pierre-louis.bossart@linux.dev>,
        "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Thread-Topic: [EXTERNAL] Re: sound/soc/codecs/tac5xx2-sdw.c:984
 tac5xx2_jack_init() warn: missing error code 'ret'
Thread-Index: AQHdH0CXGGfEtMgjGU29cvbpjYmUKraEmUsA//+v3DA=
Date: Wed, 29 Jul 2026 10:38:17 +0000
Message-ID: <15b85f936f414cfd94755e25b280b105@ti.com>
References: <202607291308.8OeeiyIv-lkp@intel.com>
 <8a416f4caf9d41168a38e04140486aef@ti.com> <amnQwkLaHtbkH2Me@stanley.mountain>
In-Reply-To: <amnQwkLaHtbkH2Me@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|PH5PR10MB997756:EE_
X-MS-Office365-Filtering-Correlation-Id: 698021ba-4d8e-43da-9c9f-08deed5d8184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|4143699003|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	gHl46Q0p9Ng1ygVBPei4Hj0T5SflgfEr/TO8zOs5MdwI0nOwQBNdHObLL39LKfYSiqlD3+hbGRU//IkETbVFJzwDJ0YHsMsWAKtd8aTMxHI+wp5csBbHcdr8pEbM1WH8EnBnTu1JFlHxAYTKbdzyM/0d4o+NQmxT/0nW+XMZSJZkjYbNxkksTrImBG2bbnMBsp+hexSlK1hDKp8gp8BeSaa8B4tfOnsXWK4S8tj4gZNBxvP7TGJYkfYHlUmkYx1mU7voWXhEuzLFiIsmKZymUm6gejFXPsg5Q8Vn2v57ZRSAV/2peGbq8SKS5bsarBrBKYzK4mEevMwVE6uUJx+vdmqB3KrA/HCySE9wJtN3/DRYXJclrLULDiLxN/nqtMBA33w0zEsX5nYj9B1v8L6oUcojYiJNd9IngqMMPFJmgnWE71kPRQutoEA9MT9DXL6GDLQfbBcouENzODcUqoD9lL6KUPKIwBls1wB+6E27T1dWMi+7w+hM/M8CYiq+EUUXqbq+aZAWNmGGwsWs97vdi4s6pc0BgXUKaE7VIYDgGZTO5iDT2ZG3ofjdUr8jup5OCplkTrwNWde5RXeFfTqvcHhWb1cqiOZXgvHB1OXSCJRw/aOlUgnXKdTRwoiQ+J+3v3B3A3aMM7U3XezKWUJpwQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RLNR2JdBDlbmNYiL4Mxo0ZX6R+4PR28KH1a81TWOL+wRCHrNKVlh81mU3G02E+QtAV7CIYes2s3KfQ12gfDntatHu1/Qi6svK9izOs/3128Nw69uEZcYUWBjZdQ+QwcEHFdWX5v+uxiVDcra1NNJKh5QFwuexnBBDS38il/Xk2exDN2xrepGl2qZSgJx4dbF5Z0NShAzL4HOmsgZq3+zHuMKYAGrBDTnfnZunHf7nRQuWEnDr3olSOzfCOpIA/NdWNQX3BeTpLTtJOfKu1qHfjPlA3mwTC4qjLmmEzIamqvQDGn4PbiH04TFh8PD2qDoVARbhI/pSfzAWPHp2hrmFdfeMC3FTkfaRneJDwYmWN4I1d+dImznTeahj0IhMR3ymeYYZrBFgLqa3Fim7zEewrHaFl5Zi/HtgHcPR3jRtLkMfZM9kdgMYp3jePEbTEwe
X-Exchange-RoutingPolicyChecked:
	cSuRqxZoy28pxs13aiW4RK4tMTxeOXPIw4sp2PkgZlkmK5MPoAb4935sIjuNZtucL4bwYNFH72YWHqGhqkGNvdwrS4aD7WHOATkPPQrNFaoRSt0Hf5KVxPuah214UFe9P51EpjJm+ET4N/2tjMjHYmbcckQHsyCjBasA4aYuRZ5DhCfbVho0cAy9DtNOQ1T03AWUL+Risq/d+7L/NDwGZqtO8IBwgsrqmqsxqSMOl6EF4zZ1pJapGJhVJ3rIRuH/RPZcJYueNYhpeMC9Eil5iQ0ZkYBdmHC6uDRz3YadZnKcqqqwkJ0uVyXDiIawErR5218siBlD+m+wxgAM7LbRVg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:38:19.2695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 698021ba-4d8e-43da-9c9f-08deed5d8184
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997756
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NyBTYWx0ZWRfX4JuT13pBsj7e
 U9Ha+decDrW21nLjt2OI8QmBOT67V2cPEC8SK2DU3Yr0BL9LlVqpKtgkKeIRd+QQBRzMnT6pEi5
 2o3Rk8Rf6caRlSVFlvbIRqjkCO6U3BoRF9RImdKAed7nR9t+/KbJjWb76oxQzmkZQCOCkhvKIGF
 dvgUGtB6069rHWE5dMcs4THyIr67BoHt+J8A6yCw+Vv/YrInjr6I8CB9ysqC76HNl0KyS9CzyEr
 Yqd+OvMzEN+/TDS4qqHazUmw1lSYlC5cmYeX9wwfBUHRAm1p8R07Bw3Gj32yG/imfIBF/LDTX0v
 RLZdUYnQO/YsGFnQQqkvPp4jcCw32jPI2memFlWo6GncysipAauLC4xe1CXVeor2iuIUocSvC47
 ftYjV/Xy87wByIHzWIbBQTsHrv0goXoCFPF64YdYbQHOjrHFldXPv+y3E1VN/DSG5LOK0w8l7aI
 RxtN4/YfmyxipSvooRA==
X-Proofpoint-ORIG-GUID: tcNt20Dv-ihiZ76F-LzF0IO-nPX04N6S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NyBTYWx0ZWRfXyxSkHBK8rao2
 fe+gqUX41Tr5bXeF7wuRf3xUJvHpSiLq76SpORlmlDmNhUpFigopAENt1su3dbR7MzbVbqc5ArS
 L0C2nyuy/mksUvXvrgxizvAwnwWP+mY=
X-Proofpoint-GUID: tcNt20Dv-ihiZ76F-LzF0IO-nPX04N6S
X-Authority-Analysis: v=2.4 cv=IYW3n2qa c=1 sm=1 tr=0 ts=6a69d81e cx=c_pps
 a=5k1muW5XIJfqWNzrwyhXkQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=hd59Zx_pdMwA:10
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=P-IC7800AAAA:8 a=H91dBpW-aTRZc8BDuJwA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22
Subject: RE:  Re: sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn:
 missing error code 'ret'
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290087

PiBPbiAxNTozNy0yMDI2MDcyOSwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gU3ViamVjdDogW0VY
VEVSTkFMXSBSZTogc291bmQvc29jL2NvZGVjcy90YWM1eHgyLXNkdy5jOjk4NCB0YWM1eHgyX2ph
Y2tfaW5pdCgpIHdhcm46IG1pc3NpbmcgZXJyb3IgY29kZSAncmV0Jw0KPiBPbiBXZWQsIEp1bCAy
OSwgMjAyNiBhdCAwOTo1Njo1N0FNICswMDAwLCBIb2xhbHUgWW9nZW5kcmEsIE5pcmFuamFuIHdy
b3RlOg0KPiA+ID4gT24gMTE6MTYtMjAyNjA3MjksIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+ID4g
PiBTdWJqZWN0OiBzb3VuZC9zb2MvY29kZWNzL3RhYzV4eDItc2R3LmM6OTg0IHRhYzV4eDJfamFj
a19pbml0KCkgd2FybjogbWlzc2luZyBlcnJvciBjb2RlICdyZXQncw0KPiA+ID4NCj4gPiA+IHNt
YXRjaCB3YXJuaW5nczoNCj4gPiA+IHNvdW5kL3NvYy9jb2RlY3MvdGFjNXh4Mi1zZHcuYzo5ODQg
dGFjNXh4Ml9qYWNrX2luaXQoKSB3YXJuOiBtaXNzaW5nDQo+IGVycm9yDQo+ID4gPiBjb2RlICdy
ZXQnDQo+ID4gPg0KPiA+ID4gdmltICsvcmV0ICs5ODQgc291bmQvc29jL2NvZGVjcy90YWM1eHgy
LXNkdy5jDQo+ID4gPg0KPiA+ID4gMzhjODlmZWRlZGQ1YTkgTmlyYW5qYW4gSCBZIDIwMjYtMDUt
MDUgICA5NzkgIHN0YXRpYyBpbnQgdGFjNXh4Ml9qYWNrX2luaXQoc3RydWN0IHRhYzV4eDJfcHJ2
ICp0YWNfZGV2KQ0KPiA+ID4gMzhjODlmZWRlZGQ1YTkgTmlyYW5qYW4gSCBZIDIwMjYtMDUtMDUg
ICA5ODAgIHsNCj4gPiA+IDM4Yzg5ZmVkZWRkNWE5IE5pcmFuamFuIEggWSAyMDI2LTA1LTA1ICAg
OTgxICAJaW50IHJldCA9IDA7DQo+ID4gPiAzOGM4OWZlZGVkZDVhOSBOaXJhbmphbiBIIFkgMjAy
Ni0wNS0wNSAgIDk4Mg0KPiA+ID4gMzhjODlmZWRlZGQ1YTkgTmlyYW5qYW4gSCBZIDIwMjYtMDUt
MDUgICA5ODMgIAlpZiAoIXRhY19kZXYtPmhzX2phY2spIA0KPiA+ID4gMzhjODlmZWRlZGQ1YTkg
TmlyYW5qYW4gSCBZIDIwMjYtMDUtMDUgIEA5ODQgIAkJZ290byBkaXNhYmxlX2ludGVycnVwdHM7
DQo+ID4gPg0KPiA+ID4gSXMgdGhpcyBzdXBwb3NlZCB0byBiZSBhbiBlcnJvciBwYXRoPyAgdGFj
X2Rldi0+aHNfamFjayBjYW4ndCBiZSBOVUxMDQo+ID4gPiBpbiByZWFsIGxpZmUuDQo+ID4NCj4g
PiBXZSBhZGRlZCB0aGlzIGFzIGRlZmVuc2l2ZSBzdHJhdGVneSBpbiBjYXNlIHNvbWVvbmUgY2Fs
bHMgbGlrZSB0aGlzDQo+ID4gICAgc25kX3NvY19jb21wb25lbnRfc2V0X2phY2soY29tcG9uZW50
LCBOVUxMLCBOVUxMKTsNCj4gDQo+IFNob3VsZCBpdCByZXR1cm4gemVybyBvciBhbiBlcnJvciBj
b2RlPyAgSSBmZWVsIGxpa2UgaXQgc2hvdWxkDQo+IHJldHVybiBhbiBlcnJvciBjb2RlIHNpbmNl
IGl0IGRpc2FibGVzIGludGVycnVwdHMgd2hpY2gNCj4gcHJldHR5IG11Y2ggc3RvcHMgdGhlIGRy
aXZlci4NCj4gDQpJdCBzaG91bGQgcmV0dXJuIDAgYXMgd2UgaW50ZW50aW9uYWxseSBzZXR0aW5n
IHRoZSBqYWNrIHBvaW50ZXIgdG8gTlVMTCB0byBkaXNhYmxlIHRoZSBqYWNrIGRldGVjdGlvbi4g
DQpBbmQgdGhlIGludGVycnVwdHMgd2hpY2ggd2UgIGFyZSBkaXNhYmxpbmcgYXJlIGphY2sgZGV0
ZWN0aW9uIHJlbGF0ZWQgaW50ZXJydXB0cywgYmFzZWQgb24gd2hpY2gNCndlIHdlcmUgZWFybGll
ciBjcmVhdGluZyB0aGUgamFjayByZXBvcnQgLSB3aGljaCBpcyBubyBsb25nZXIgcmVxdWlyZWQu
DQoNCkkgc2VlIGEgZmV3IHBsYWNlcyB3aGVyZSB0aGV5IHNldCB0aGUgamFjayBwb2ludGVyIHRv
IE5VTEwsIGZvciBlLmcuIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjcuMi1y
YzQvc291cmNlL3NvdW5kL3NvYy9hbWQvYWNwL2FjcDN4LWVzODN4eC9hY3AzeC1lczgzeHguYyNM
MjA5DQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ny4yLXJjNC9zb3VyY2Uvc291
bmQvc29jL2ludGVsL2F2cy9ib2FyZHMvZXM4MzM2LmMjTDI0OA0KaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjcuMi1yYzQvc291cmNlL3NvdW5kL3NvYy9pbnRlbC9hdnMvYm9hcmRz
L2RhNzIxOS5jI0wxNDQNCi4uDQpJIGJlbGlldmUgdGhleSBhcmUgZHVyaW5nIGVpdGhlciBjbGVh
biB1cCBvciBwdXR0aW5nIHRoZSBkZXZpY2UgdG8gc3VzcGVuZC9zbGVlcCBzdGF0ZS4gDQpTbyBp
dCBsb29rcyBva2F5IHRvIG1lLiANCg0KUmVnYXJkcw0KTmlyYW5qYW4NCg==
