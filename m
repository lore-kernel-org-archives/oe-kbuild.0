Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05C04EF149
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613507; cv=none; b=Y15rYxsgTLarOTcpJNb36YhSmNVnfHKr4wLhX3o6mTz5nnP76/9S00JdvZIMb1G1CVMtGEfFUUhUXxy3p33aj1aLsK8/58lNlrwzM5P+yTg9vAs+0jmATJw5ztUVnBRTh475JOHLsvUt2G/qsMEusIyltR84vOtxq404UrUi+mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613507; c=relaxed/simple;
	bh=zNdfiG6a742J2vc5UTLGFrSGexs/heG6WK1qW+A/N1I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sMe3enr4nHeEtSRv+v8E6LDqSZpOAoTFRxbyyExtcMAZqn927opwq0W42fJQbA+G4Sa5QAc6L5gZEKINWxBG6PMUTnpAFEBQU54FXKHWhehP1yRrIRhS4+dyMDms7ASm/1CzvI/dNgqQTbtb4OF0mY03nIm8LNDjd6QqbzfoOV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aip920Nb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dc5m4Vsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aip920Nb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dc5m4Vsf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe3Mf2298462
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 16:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gknmQ/S0b94TV/AstFhqEV9YUYDToNvtMNFQMDBLoDc=; b=aip920NbjcvZfGYs
	k9BPpsSRvChY2gfG7JYxnVq4IKugVQcQl2+9bCF4gce7K1B718V2NasdpOwsN0de
	63Y38NV0lwzJgTP1jm4Zj3vuJU87gsaRMt7bPAGUyVGriVBdaiyh+yZx/qXN7eB5
	gQ51Nc456k42TyXcuJy4I2tw4x8YAcsrZ1m7y71MWUmBnKjwwVz+2AVgvcwVbwjg
	fe5UwX+CLjvge5a5r9swQdAqWwK2el8iKqkP3HASBdQRnCG7c+Y23WKwfpacDHch
	h3vhF7cCKI+acEgOCZRe7FzM1YQ5lusr4PtQtdA9D5n57/L94RLv7ZJ+dlcBGye0
	YhWg7g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6hsry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 16:38:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34344599f01so564643eec.0
        for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 09:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613503; x=1791218303; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gknmQ/S0b94TV/AstFhqEV9YUYDToNvtMNFQMDBLoDc=;
        b=Dc5m4Vsf876CQXqeib+IA+lP9YM96bkUNmd4ZxeMgfPGl+HSAe3dw4rT7anM25vkZ/
         I2lVgMhfUwO0rFIm8Ja/RyvvyHnVic0XVXQ0bojLYjS+91G4yIExx7T7cXM987HToFUT
         XdKt0BBLwhE2xf1Cp4jHAc0ceIxCqIrHZWRh4qAhuIZ45VLoX0Ev1RbSRO480Si6B8qX
         k7SkxUVGcZpo5aiZcxnUcbPhYLRifeq1k1P9bnA6p9i6wL9rZxhJHeZF83jsad6MLbhF
         c1Xp4LlCaTucEH22ZkfSORHr3Mw/GJSs8EN00hIgVRwYRnk9fNYXW5WbI2/vnHwG9qLN
         aiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613503; x=1791218303;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gknmQ/S0b94TV/AstFhqEV9YUYDToNvtMNFQMDBLoDc=;
        b=0Y54Mve7KWnCJmj6mF+rNHUHR62g91boO1zafYimXA8m712Nz+TL5k3d/jceWPk1of
         nW3AMYJg2tpWC4TVdbyh7HK0kP3tY185lyYR+/HpYV1FchQwIXG3Cr5B/ybKjDLkPk1H
         yRC4635UThw0pZRBxNFNyxPT35hqwdsvq43PvYovTEZ6OB8U0wldYaBkmRGi5PN+i2QV
         9kxeRpVdQWxOXSrIxUH1EieHn4j9OLz/GMC0wz+RAfcdeUDrdrxYMbNM7Miupt7LDPPX
         bT2IFwPbbfwhU3PMoQVQfNnkfZ/OmGD7G8xqbfmgi5ZUkDgHUa88lHAMaWbybjZp4/EC
         zJpA==
X-Gm-Message-State: AFq9FYJanXizP93Sk+4Pna/BrevffNRl24TvLlJoFFF+h3cfwyQPHvWi
	2Enl+lx0Y774jytyAwnkXnjY+sGb0QrHpfS8m0BMGdeTyT/qJRXTeQF0Jf5+ute0xAG6BTFw6Sp
	VfdbQRDF7c8/ANn47KRmnC9EqDk0ax1da2mE98Vt3ZXlM5D9R+W3xPCZkNm56V8Y=
X-Gm-Gg: AYBFou3wBw2T8fQ/rvDaBOIUbXC2pdGpPHHHl27/U7LDtlPojaY5FLdNrxxDJ0kzlRL
	Ascb1z4o0OovUu84dp3IYKq6YupHkxmivxFpvAL8fBnDwI/j/owtwKyj8Zk7lnDjeW3sF+aPnFD
	WF1qbc5g7Uw1r4dFZYt4QU975bOWrCULLhZcndKF5G5OrhfgIkK5Xn1d//dfa5WbAml9+NzsOVI
	zjIlyeamcYXdgkXhBwL/86UZ+EqJD1gj32zIAbmSDLa+VO/77HjpCBC4Qz7iBAHHDfj8Q/v9Zdz
	xmPXl5YgF3EDD11o5Q2w33OUinMTvGE9F8lYuX6PeBvhsXho3S9dNp7uAZOySwDIBCGXOBYVji3
	mAJrYW7C8jcS0xHDtszfUc91AfhdrVVSdZNj524ptWtrjJ85ufEdPSA==
X-Received: by 2002:a05:7300:dd06:b0:33b:f5b7:f4b3 with SMTP id 5a478bee46e88-342727564a2mr10015277eec.27.1790613502360;
        Mon, 28 Sep 2026 09:38:22 -0700 (PDT)
X-Received: by 2002:a05:7300:dd06:b0:33b:f5b7:f4b3 with SMTP id 5a478bee46e88-342727564a2mr10015249eec.27.1790613501733;
        Mon, 28 Sep 2026 09:38:21 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145d0fc9fsm31019134eec.25.2026.09.28.09.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:38:21 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:38:16 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev,
        Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, lkp@intel.com,
        oe-kbuild-all@lists.linux.dev,
        Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,
        Joshua Crofts <joshua.crofts1@gmail.com>
Subject: Re: [jic23-iio:testing 66/82] drivers/iio/magnetometer/ak8975.c:627
 ak8975_setup() warn: passing zero to 'dev_err_probe'
Message-ID: <20260928093816.00002894@oss.qualcomm.com>
In-Reply-To: <202609270219.cCECv2b8-lkp@intel.com>
References: <202609270219.cCECv2b8-lkp@intel.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX1VcsTdHe7WNE
 cKUBkxdJ9x1JGOxgqMLP71QAY4Dwp9TVGKrrVtnDbvkFUdtZmE0i97eACj4gyIiwKI8ydLJgxYQ
 daAyfm3i4m/xxOZHkr3p70r0xCgAW6SsHZ1n9Ypl6gYI67946TeyY6V3frSPwMXtT0t8UMFdkQJ
 4Y6VCQZFIbCkE/kRD3NdY2OxRuvI24AtrYoNqcExjeQZabpBLJERD8DrJwvfArHMz61sFfvXJoJ
 n8K6ID2mdEmi8+vFz4/yGB1ROnjnAZpzsArzQvadMmfVYlHxXph68+0Kxm5n4eFG9Axd4JMbY1Q
 /Uzh3/A0CTN15PkhBlBxsBHG37gNqcnrYH+wBLZWK5CkztINXKj3xju491x7CJ0NS5bpNf46INV
 CfzFIOIGYraJ73RziHd9mGBe4IjlKggBtOWRU+yKVjsNv15ggKzrsethoB5kSYV+SGibCGjNc51
 MSp8PQI2vuBLsT91l9g==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba9800 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=Olj5whoAGE1gubjfgVsA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX7ylgQpQSpbIG
 tmltJ7GuisCmdeVrzJ7dvuKsZ5maTTpNefeM0JtuyA7GPiFOx41U0HR9xPKdBXiJOWA+9T56FwK
 zZOT1TL4CzcF0on83a164qrKskhlmm8=
X-Proofpoint-ORIG-GUID: LZqheqfPK7c_B2URuAEuEHavQqKxuTUC
X-Proofpoint-GUID: LZqheqfPK7c_B2URuAEuEHavQqKxuTUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280066

On Sun, 27 Sep 2026 17:49:30 +0300
Dan Carpenter <error27@gmail.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   e5b9e42a20392b669097c8c4aa09c3aed82ba10c
> commit: 4f8ee49c28b1a537a23e64cfee6ff2e5ec616f7f [66/82] iio: magnetometer: ak8975: use temporary variable for struct device
> config: x86_64-randconfig-2200-20260926 (https://download.01.org/0day-ci/archive/20260927/202609270219.cCECv2b8-lkp@intel.com/config)
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> smatch: v0.5.0-9187-g5189e3fb
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202609270219.cCECv2b8-lkp@intel.com/
> 
> smatch warnings:
> drivers/iio/magnetometer/ak8975.c:627 ak8975_setup() warn: passing zero to 'dev_err_probe'
Fixed up and pushed out.

Thanks,

Jonathan
