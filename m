Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC48C4457B0;
	Wed, 29 Jul 2026 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319045; cv=fail; b=PF80OoEEZVK1AFd8RofHflaUkryjwsxwIRxc1OOzsdPehLKOa9zfrxqkf+x6iL7d8yVMNGFO11/zy5KuwX2sIdRpP64gLrdWUgivlh/45Tez4jeOKFJAsg/GmM/pim2+BKvzrJXA4gg652K69PYMPLudY9ecZbZ4MJhh9IyFFqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319045; c=relaxed/simple;
	bh=SLM2pP9Ns0NC8CqjQ+6JI+qgnm8Y8a63b2A8CR1iRZY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MIBwkGHcd6XeufU2GR+JvGhSmq5Vk2fRv+Lgyd+9idW+w/I1FF3FHRWSGpuowEVKyb5XPKgQ8yjGVjAWczmnnvSv/0D7F5ZmUYI1YwdmNrwoVVR3jyngNPjgR5cuTbDEbnVB3b/6mpx0sQN7b2l/nWOkwJ4d6X8S25wGfRHht+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=I1+vwTQC; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=N/taEP2o; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="I1+vwTQC";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="N/taEP2o"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7ebsq2161968;
	Wed, 29 Jul 2026 04:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=SLM2pP9Ns0NC8CqjQ+6JI+qgnm8Y8a63b2A8CR1iR
	ZY=; b=I1+vwTQCYHgkfGW2AFZee5J/WTx3t8X507e49IyD4OK2uAoWWOv0nsWm0
	iC7xcySKBYx688D0XZ1MS69dZolSCqOxE1nMN+SCZy2khf0Ro2XyP6YGKyA/0XCS
	sPjbaTIPshcLLeEU651LkJo3XfK/LHuZvqMFyL7hIDESURNP2Myfi0+dJsk/nBdT
	+CXsTYQei8/FO+M9YBn7upEdnP6A0iFq3I14Gw3GKjKZ/vDv37afdUxNlHY1wWiy
	WRI6PcmXkgacC/fsOXfpR7ZDhE40mkKJjSRJFfzcjcyUR6W6IAReUJSmhfm8OySQ
	hvLRzsrCx9vFpo99+PTOd/DxPGYMw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010038.outbound.protection.outlook.com [52.101.85.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqcwv0tcn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 04:57:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEa2HUG9OtdGT6/UIw8emwxi+E9/HFy4Sv7jiJ6vplRVJZ8APWL9/aCWWTCYKU3xSeGXbCS/PT/nFy4IuzlkbAZD2NKJVP6k6HX76BtJ1HXU6raQqGMQX8yu5vy1mqkYJ8rlgb6oyrhD181iLeZ0lbdmpjDOn+Jjt6Iuy62GQA64EmI5RNRslmL+gJGV0sg9v2dW/4zSyvqBUhsNeZa7XMiUwpaKChGONCeH9pTriIZ0CY5HWSntox9Kzh7p/GJOPd9j2a9EOvm4VjhjLDu+Qgwm3WMDYTq43pVVg5Lk3OYkOLi3NVOGZ6VrXna7mvno0+wllkhE/+Z+y706Ofx5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLM2pP9Ns0NC8CqjQ+6JI+qgnm8Y8a63b2A8CR1iRZY=;
 b=dykzeB/PkaQkCC5EzwgjVpFBx2CPVCrGFI5Fmzft2I0MNNTYK/04Bi+GlKePrDMukZAxTR3eQHDZlxBD/H+VCfE6XBWpbrwI6y34cB+5FufZ8csqvQIyRgcTZVls93sJo4cC88BXg/LIzfQRX7IXxd2kGzw1maROGY+n1nPDfCZlUIOfpyBeTb2+M5yl7921BN4vKZR7pVHwVo0ioYA36KQHUOVC2reGzbeD35ekzXxZOzFRO74JiOyQKojDQisqn0x2bMm3sHU6Tjk8MZiMimU2x6IlRSjPgVXpqEuaB4f32EnxIP75sKSpvP6fcFCOF4WEBfrePcdhLoVVNDd9aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLM2pP9Ns0NC8CqjQ+6JI+qgnm8Y8a63b2A8CR1iRZY=;
 b=N/taEP2o0cEEH2C5M2rqrQ3awVbKd6C9oVggCqVNprnLc/rQE3VPqgfdFBEuL2sX7iKsBkYCLScFKipx5hljr7hkzmDnM2JTHiSHxaWXFoJuHUEfA9NTy/gWDjKAJBk24VFkLa1FDb/HIjKaZojgBpz1ljt7cKbDRZ3IzMFi30c=
Received: from SJ0PR05CA0126.namprd05.prod.outlook.com (2603:10b6:a03:33d::11)
 by MW4PR10MB5677.namprd10.prod.outlook.com (2603:10b6:303:18e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:56:58 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::2c) by SJ0PR05CA0126.outlook.office365.com
 (2603:10b6:a03:33d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 09:56:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 09:56:58 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 04:56:58 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 04:56:57 -0500
Received: from DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf]) by
 DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf%14]) with mapi id
 15.02.2562.037; Wed, 29 Jul 2026 04:56:57 -0500
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
Subject: RE: sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn:
 missing error code 'ret'
Thread-Topic: sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn:
 missing error code 'ret'
Thread-Index: AQHdH0CXGGfEtMgjGU29cvbpjYmUKg==
Date: Wed, 29 Jul 2026 09:56:57 +0000
Message-ID: <8a416f4caf9d41168a38e04140486aef@ti.com>
References: <202607291308.8OeeiyIv-lkp@intel.com>
In-Reply-To: <202607291308.8OeeiyIv-lkp@intel.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|MW4PR10MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: c344dec4-79bb-4742-c941-08deed57baf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	24/MdwjW3wWKK9Zfu52WhAWcIPbdDnKez635HEt8E727iawrYCznEM+4ExK5AE+HoTJy7o0HQ8h7VD11HQwD/Vi+Q20M1PS70Hf/pkwg0YszgjbLpaKIXx8dQP0gWbj/HvaOK9Wx9vMAlXQrtK7jD7nwBa67vyqW0hfQhBP2wkAdTDNdSqE7TNwpDYuZefHpBJvwtnBPD/FNVnoQJRgnuA4hf5zmVJ3P4uZASRXE5+LkTBlsRX/0IPmUUxSODo2z31o0D/HxumLf1FcBEghsOI1yS0qNUn5hJaX1mrGcKA4ibnkkp+NEcm4ZeDKjG4vSH/rh/Jttu1AMwFIsKM690c8v0K4AEmEymXZW4yt7dMxyc/2nvvY+OCXrTjtKMAJWUfaXBjnKkw4A5qQ4nlV8UcqkrrrUR0jv80S7Q0sLtsjDZVMFer2OVYJ6mWtUUbb/WaGYhyYcwzRMuUG1n96FBEvnoFcONi256fuCJ02Iiq528BNkJS4RaDPocWPLkS/MzdzGMcNJ1pAnwdjFeFw+sBHQxVnTBoU7y46HP9hqC4/y1w13ECbPsMWIO7XH4aIFUZqOz26DDGwbxzdJg2sBIIoyEo/KnUO/zQ/M2dXG4yYyL/aGTRIv7tytL2NJWlsenieq3PuLYzmoAEY1p6eAkHOHAqcT70qNPM1o4fdTWdKWYzdaayVln/npt8hlKrgc
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mBh1cSALMw2yw/OlbmHth7t6riJaG4xGkA1ixdPvpagdvHTvuKPWH5rv2fTKR2Qoj/pJwuTXOBxheJ39zk9GxvCVYAXrVU5oHGhLQNHlr4PfYzoqgJds/YGNVFOSw8HGbrnmkz5JaX+oqiU35zEN4F7ViQUuAdpUwg4liFvX2VX4QhOS7sABWIW/66xaDwgNyPaJrNJBnX0rivKKxsc4QhEjPxncW7Lz5pNWe6+W9XY0epo5MRggVJGm62WnpDGwlcaX1idV/Fdw/UGBI2+yxaUFcZwTII8/+WV5VcCd4ISv5NOLIsa5jUcRSDxnDegG6DMdhjtyH7lXBP+n4tHkwVadOq6JZU0eZ5gDq5zphoIIv5z4xwT3ZKUmAytD/Lipp62UNNc6w1KAQxb732lN+PdkLW76Pg8r7nqM655jDg0alPwIX5jb5uirsv6RiLoY
X-Exchange-RoutingPolicyChecked:
	p7edivBa7qkLLU4ntY3ZRbSbzNVFIxKrffwle5e/CnvYhPUTXGE2KJUENfye5ZNb+yvgAHCRJlvjf15x2MJOQSKvlhGBplYe6Zl/ZXOM6knw47q0bg1OdAZ942Ypnu89Q9SqoRuRAcqhRSTm3b3gqe3IrY9n+dGsxl9t4OLBq68vqnam3/yZ9KK8xoiOfuuW3ML26ovabIfDXARmrAWy6HgA9ZnWpTWeTrTl3vb1lNR7NnpHB67CK5Rb5VAhiLmKBbsMr12fwx+3TlJ98dkM8JZamBILwH+1yKeCrIfDZy9xPcMuzERFSrIzjiBQb0QMs3qSYf4N1qmFg3NHJfrccQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:56:58.6257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c344dec4-79bb-4742-c941-08deed57baf3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
X-Proofpoint-ORIG-GUID: Df4AnQv1SxRyARqepE1tiX7RyKVRAbpu
X-Proofpoint-GUID: Df4AnQv1SxRyARqepE1tiX7RyKVRAbpu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4MSBTYWx0ZWRfX+nTsGYuUM1YA
 hUZyYgbfirSsB2AdbHY7CtOWCPkxu1klp6sw1V5amGCYfW1hsJivo5cxeUxDjSlyA+/sHnsXx2R
 eEcBVS89EBCdFrqwdCVfWxx5Cetv8xM=
X-Authority-Analysis: v=2.4 cv=PsijqQM3 c=1 sm=1 tr=0 ts=6a69ce6d cx=c_pps
 a=EPZJxM4MYJNUcCtligPUUQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=hd59Zx_pdMwA:10
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=x-cJyfQxICJ8NWX9D6gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4MSBTYWx0ZWRfX21lDARqhdGkA
 L0z4LBwZNpS0pclMLj1dgToKdXr3I9yniWkNwKGZg8NFkfKHGr08gWBk/8oEqEYP+1KJZsxBLuO
 v1w+VCpeiNxb2ezeP8/Htx1CuHDZ9wlkdL+o/wSbbqy1Px0DPtNeNVca/H+6oxrGvisFU5JU+mw
 F0gODgG0bz6K6Th2WvhN727CafjEfZNtXNzDBDfTYTbSwg8VVUuX0JyN7w2xJX8o/5aFqTUo91X
 hVhcGM3E2JEpXe+rx5G6H3gfr1hf57A0ncQyb78CKqbTQWAyBk/kq0c3sfrD0ZaUM6ik1koy8Zn
 D28GcCkEd/sLAuB7uhk/jdyMwC8aKJbVWHysCvd7enN9BRiiM7DqSF9/ydsAiC+ys13Rib0oFXo
 o36fmc5hn00VaGS4p2A2oQ8oWxZ1Ty6SOa3QvhVqdCRaIrhnVcjZmdFhn8RE58pvYulXWuSp8TL
 paSdt7CWNjr1IPYzy8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290081

PiBPbiAxMToxNi0yMDI2MDcyOSwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gU3ViamVjdDogc291
bmQvc29jL2NvZGVjcy90YWM1eHgyLXNkdy5jOjk4NCB0YWM1eHgyX2phY2tfaW5pdCgpIHdhcm46
IG1pc3NpbmcgZXJyb3IgY29kZSAncmV0J3MNCj4gDQo+IHNtYXRjaCB3YXJuaW5nczoNCj4gc291
bmQvc29jL2NvZGVjcy90YWM1eHgyLXNkdy5jOjk4NCB0YWM1eHgyX2phY2tfaW5pdCgpIHdhcm46
IG1pc3NpbmcgZXJyb3INCj4gY29kZSAncmV0Jw0KPiANCj4gdmltICsvcmV0ICs5ODQgc291bmQv
c29jL2NvZGVjcy90YWM1eHgyLXNkdy5jDQo+IA0KPiAzOGM4OWZlZGVkZDVhOSBOaXJhbmphbiBI
IFkgMjAyNi0wNS0wNSAgIDk3OSAgc3RhdGljIGludCB0YWM1eHgyX2phY2tfaW5pdChzdHJ1Y3Qg
dGFjNXh4Ml9wcnYgKnRhY19kZXYpDQo+IDM4Yzg5ZmVkZWRkNWE5IE5pcmFuamFuIEggWSAyMDI2
LTA1LTA1ICAgOTgwICB7DQo+IDM4Yzg5ZmVkZWRkNWE5IE5pcmFuamFuIEggWSAyMDI2LTA1LTA1
ICAgOTgxICAJaW50IHJldCA9IDA7DQo+IDM4Yzg5ZmVkZWRkNWE5IE5pcmFuamFuIEggWSAyMDI2
LTA1LTA1ICAgOTgyDQo+IDM4Yzg5ZmVkZWRkNWE5IE5pcmFuamFuIEggWSAyMDI2LTA1LTA1ICAg
OTgzICAJaWYgKCF0YWNfZGV2LT5oc19qYWNrKQ0KPiAzOGM4OWZlZGVkZDVhOSBOaXJhbmphbiBI
IFkgMjAyNi0wNS0wNSAgQDk4NCAgCQlnb3RvIGRpc2FibGVfaW50ZXJydXB0czsNCj4gDQo+IElz
IHRoaXMgc3VwcG9zZWQgdG8gYmUgYW4gZXJyb3IgcGF0aD8gIHRhY19kZXYtPmhzX2phY2sgY2Fu
J3QgYmUgTlVMTA0KPiBpbiByZWFsIGxpZmUuDQoNCldlIGFkZGVkIHRoaXMgYXMgZGVmZW5zaXZl
IHN0cmF0ZWd5IGluIGNhc2Ugc29tZW9uZSBjYWxscyBsaWtlIHRoaXMNCiAgIHNuZF9zb2NfY29t
cG9uZW50X3NldF9qYWNrKGNvbXBvbmVudCwgTlVMTCwgTlVMTCk7DQoNClJlZ2FyZHMNCk5pcmFu
amFuDQoNCg0K
