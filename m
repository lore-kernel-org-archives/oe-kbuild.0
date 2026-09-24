Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9906A36F915
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254295; cv=fail; b=qwGv8xjzElQ/n2XMRUZgZwM4RByEiIqKn5rwCxpTqU32C1EwVMAttghBdaIm40d2KFSBW5EmXSGlzjWyG8alHWxgO/WRshVJKLFH005d21dD2HdVD6A8fY5XuP/TMwFrRutsevB4F1KyTNmBE4idnnOVXLZtsV/CavVy0V5ut+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254295; c=relaxed/simple;
	bh=ixFuY2Jt8gFg1fxu5+M5u16B5dYqpEDJKQaeoGp5AhE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSz1wHSQ3lmJ7oIxbgxUy1V87FO/xPjWJ5/SalDtSZFhQpajtR/lvMTgXyXDWLhxTUPPo8vUUPH7jUH0EjOjgWlYQux79jP7avGTZe0N+TwuVRiavXLk5YE4mE4xgF1jHdB+PyZp9VfyK273VHTHyFBueG+pEzxtyIUiu5VSnfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=aaNPPs58; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BMtk7GtO; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="aaNPPs58";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BMtk7GtO"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC8J8b3983334;
	Thu, 24 Sep 2026 07:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=GjvQKo00I7bapV/
	sGBoWt1ZsdM/xvvQs90nw3e0kThw=; b=aaNPPs581yJ5dfCj7Ud9pugKI37F8sw
	UQo+fW5k+j73FXG9Xy2hL//uMYP/bQjkUI8Ij6FSJQzNu3IXMxNuSDgewa7EZDH7
	e9kilEEN+GU9s/OCEtFCfz+2yRfwe5kk0HKF2Lv9y7Z/vH+DrS+4UbqhT5iR5tAE
	sH91OukvtRx+kKPysIYs6TzLCwkk8q4Jf31qpNEthLzEHegHC3P7uW9x2K3ekurH
	41GSnicq8ZkcsQZuzampbAqDkWIZQ9ulP6haHbN2sPQXqL2ICOAuJaq11nlvqAAD
	ZQJD5BVMqgBAfjV9q6DxFlrIppy7Faav11+wpSdMwAkjHKINKK3urpA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gvt5dbc98-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 07:51:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDa8z+Uk1cQd+3d3ll/zSfoAyRzT/xsbJ/eiS4uYCFtngo7O/PKlawPw3+wJQMOmHjXUBhREGqjrC88dp1CQfOeBBvLH4E/JVx79h9cKJrvNDR9XhXX23MXjBo5ANR4p9NyDyAC+ik5iXYD1QLkY27BXqZDCiPtJ5BM/Np6DSy1LZpVkwPD6c3HcL5sCG8wSBV2vWIrm0eIZGJy7zcA+dWH7bP94Eg0HKSzx4vz3Q7vIYyCZbcBppQ14j2gpiY/pysBRYgbFt5vHjJjPuKpRmntCSQ1cPCf2e5fes2T5SzDX7TVZIiniCfwRf36dHGC786pXN2dA8Ibn5HOc6VnTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjvQKo00I7bapV/sGBoWt1ZsdM/xvvQs90nw3e0kThw=;
 b=ZxGSTEQY0pgsJcEEpgjg9UfwVCpsriMpPNQ3cWKPc2K747w+BvJtE7WgnQsGYheVTpiAQwOJLn/pIeqGw9W660OFMP2ggQi6X6Zip0H5pL73mkdPBfTeI2s/h++XuSa0fjiWKnYoeik6rFL7G8WmJf1R3VcxuAMXKH04ouJr7yIThYGww/YrZVPkEJBA3EcqCtp0Do/dDYTxUKVVXavUyzcQ34IdLYCcQ2lTv3NCXND491hxKDsLqYfzLhJfNvInYJiQDCUrw1Knge7nSOgtonyrPBGHlltpGrZCRTOJIIZ8Fs/CN3O6ljnBd5CZHp+9H6owqwYD7a1+htTLZa6zCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjvQKo00I7bapV/sGBoWt1ZsdM/xvvQs90nw3e0kThw=;
 b=BMtk7GtO2HGhu4rSPWeEXfVTYBeS+F/DTNLAUZT6DwmKT2CTBZCTHnVa2FKB5c6j9giKw1QDWgWWbRqwAqVP1vK7XG8nczxtHspmu9TINFR52yk2ttsUoI/Kp+5hK+0H5MIh3yC692k7tmf7yFiFGRC5F5q0n4cA2MbWvQwzVGk=
Received: from SJ0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:33a::21)
 by IA1PR10MB5924.namprd10.prod.outlook.com (2603:10b6:208:3d4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Thu, 24 Sep
 2026 12:51:08 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::57) by SJ0PR03CA0016.outlook.office365.com
 (2603:10b6:a03:33a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 12:51:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 12:51:07 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 07:50:39 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 07:50:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 07:50:39 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68OCodid825092;
	Thu, 24 Sep 2026 07:50:39 -0500
Date: Thu, 24 Sep 2026 07:50:39 -0500
From: Nishanth Menon <nm@ti.com>
To: Francesco Dolcini <francesco@dolcini.it>
CC: kernel test robot <lkp@intel.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        <oe-kbuild@lists.linux.dev>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62p5-verdin: build zinnia dtbs
Message-ID: <20260924125039.fieiigw4ddgbd3qs@petted>
References: <202609240500.IrPqcYL6-lkp@intel.com>
 <20260924110825.GA59943@francesco-nb>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924110825.GA59943@francesco-nb>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|IA1PR10MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9a78da-89a5-48d2-09af-08df1a3a80bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|13003099007|10067099003|3023799007|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iaF8wIExwIjN1BucMUTL+LKqFddC41mn2Lp3Qb+g9Rj2ZIKt/97NkCbsJXGaZquT/yf9VB403SxztBQSoS6i+hyDlQKoaZPKTXsAhf7VrKIAkMFuNL/w8ImBdUfiWN1+2GcG3IgYkSKZGpHzLPSwjGk2FFrhqwhEZvssd/+vByVxZ9b7/FE47QlvH82b6qPRNLiA05RRIqr0HzVjZnCpP9ZqOCZdKgyxfOYzdgOd3hT0OBa4xbkSJ8bnfMZKAyFa3smL/By43UrgMjiUJlKjvK4SUjmqdxiXur/QkN64Sgv7Yo6mb3f7uwmJEEhrbYxGRoA6FpR4xef4++tJX4OFAsums/R263gBcPQg7CrUPxWxeSvkKNNgaKFymOitdBeQIwEnqFSyDv6obOPE5+WaEBBcnJZ0SPD9jXd9I+AZYZI6qrQqdiAEgmG0YcK5Ojz4zPAfVs4TW1a5gnrphedNngtLPff/swJqDYxNT4WaZChADWhKYVsFVBbOWxkH23qLo34dRUCn0ivwYKSBby0StnhrYvmrOYtJjEeRjoukCDiXEd/F8bh3zRqwud4zB9J3AisKk0Z0sofq6W+nRvmFXllkYSlSn0u3ABUJJqAXwH8CTMlMCLspvODAccS3HAe4786xyGgna/lU7oX7iKrSng==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(13003099007)(10067099003)(3023799007)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TwTa13xGTxJ25xhMByBV52ZAaguMeN0ybjA+NkEeiE39b69eJjavLJ92zrUni0dvi5pZmEUPsuUmc4LeGmUN1UCwWKah36fqlcTes371r95dSnNipiwxu6Mpw5xFnBu3uO8WuZqGuNLhKiU0XAzVLEp0xuoJuOsstcqipoFP0Md6pr/CQu9oFYA8w981uMcIAhYXSR/lPGIbtMnm4CjFFKLO8hjlnAb9DJX5qDWEnVr3gxa2md01+Mn27Z+kCKz2udTd771BPyMGKpX1k37AKi/UUssl2w7P3seepiTujCAvfpxBMgMH5VwLLi7pHKFQfW//TUK2MVA2U7TI0iKKdroPk2sYXeDwiSyyQacox90z7bzxJPJa19AKTQXLXB2AsZ0F1wRm+4pvN0L+oiuMb2AOVGCr8TCBnP50AJilmm43oLunyVjL3JdrGLTFO+EQ
X-Exchange-RoutingPolicyChecked:
	qewONM6Qe4mbl/EifZfc+mU+MRvZ5IOka2agL4MWeTWVb6wZ9mCtVxajLGE7CU1puCAjO/Eu9g7Btyw0n/4eayq+9j37sYCCWRZ6Ki5MPy07bAg481Bg/JUBvfHqDYHVXn1HQ11NqZ1EWC2u/3HCxrTDGCJn9uQpYZ8JEnDgHyTiCTyC3nXaUhFQhHREdcCR5Qvc9SVV6AlyXFCTvH8Os1J8vWarZk8UJNhx446s5qlkVjp8JXjn5bCewyLPBbOwnzZ0ulCW3a/F/j0iC2g4djeZYFG39scArmP+oW9wmL/73VtTVXIneWqGkctnWzgIpWXvFaVmIMBQatVvwf+48Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 12:51:07.8686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9a78da-89a5-48d2-09af-08df1a3a80bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5924
X-Authority-Analysis: v=2.4 cv=a/elZkSF c=1 sm=1 tr=0 ts=6ab51cc2 cx=c_pps
 a=Vy3FhvgG8Thl4oebyZnGOA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=gEfo2CItAAAA:8
 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8 a=Q6m-7uFqQHb3wA-4JBcA:9 a=CjuIK1q_8ugA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MyBTYWx0ZWRfX9kZauJpCQP2J
 OUAGlaSWimYLOwv597w+55I0yqtKS3s3zYnGnnDrl52nwD+6mjY7Zliaqrq9MHLxIKKNjikjrD9
 STTcd4oM1APfJ4C434lqoWzczEOBl4Y=
X-Proofpoint-GUID: IPwxplmnb6fcBFxOze6Kp2sjqRME6aOl
X-Proofpoint-ORIG-GUID: IPwxplmnb6fcBFxOze6Kp2sjqRME6aOl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MyBTYWx0ZWRfX2e7imUORMo+I
 041V1+7T8vbDufYTV5DuGz9xN1EOg3nbQNBK2CTdDbULYDon8uXpTwFUHF+VRPWVcXP0zlzIlqd
 gdTjVmluCYSURewZlNCWVxB/OW6ZXOqnIyd5GHUyyFQDbtBEk2MlLrG8JYmMLfmXFMidLTvWFcn
 r1ky7sfdkgByhGWKdspj57UB+2EFmyJmXVo9C2dcAX9o+iu2tHwWEAMmOsbViu25CM+Gv4AbGnd
 Q48wAHdf5Deo2JW6cJaZChH3P3/sjmltjS1i8U2+dxfW90K8a4iEhEO8WjXaxw4FWhHGu25vjS6
 fNlO8aaYsdQuSSrXbAHtpBdNqp7+2C73SV0ji0xfueNhqYQrQQXONY1NL2urxGYIE0uQXGzeEDf
 PWQodbUXZ22bscI/noDWLIsEioGm/4OO9ddC2Qcwt5sNxFMTqkvX9FeSXsDVVHfJon0glgdmEpF
 H1ZqQ40kYiW/MxmYr3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240053

On 13:08-20260924, Francesco Dolcini wrote:
> Nishanth, Vignesh
> 
> On Thu, Sep 24, 2026 at 05:07:54AM +0200, kernel test robot wrote:
> 
> [...]
> 
> > dtcheck warnings: (new ones prefixed by >>)
> >    	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
> > >> arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dtb: memory@9c800000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
> 
> This is coming from k3-am62p-ti-ipc-firmware.dtsi, it just happen to
> be noticed on this board for the first time because it was not build
> by the bot before.

I reproduced this, dt-schema might need a fix.

Looks like with dt-schema v2026.09 we are clean. However,
with 840a01d414daf3e8ac0b8a386c36edb68f397189 in dt-schema
seems to have created a change in shared-dma-pool v2026.09
dtbs_check is clean. But, with 2026.10.dev2+g840a01d41
https://gist.github.com/nmenon/135665b869de3f52114fe6bf966b2caa

I think https://github.com/devicetree-org/dt-schema/pull/209 might be
the fix.. Poked Rob on IRC #devicetree (cced here as well).

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
