Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BC418C1E;
	Fri, 18 Aug 2023 15:25:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37IFHTdB004405;
	Fri, 18 Aug 2023 15:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YuEwCR8iTr8zrqFXlgUL/6EkAtAdkslsY03Y00KLQV8=;
 b=CtN8uXpW3lAJbMIOTlj4bNWQaOQ5q/yyAk+mfbgM4twRgW59mPWaX2gBInNZUBHS9PEB
 NvtFF0hl0sFbOOjpYLpTkUD+QI7indCAJVVAdYfjLlkLtVLPvmcXdTlcWU8dmgMFHfT4
 JzxN0b68OSzTcphQz4GieDbKRt1NE8fzRpclRcRAs2faQMUduuZf9Gt+SyiA/206L4FA
 QdjT0qeU2N+I7N+a43TNH0dd/Fwk/lspkKuKYqEjP08WcLlE2oL2t8P7TpXC5vRzrPru
 0xaFjZzneM0F2oM7F8TX46ArBRhUZlXLMMlg71aVIaB93/TttK7GVXIL4AVrygyP9XZB dg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sj1xdh3m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 15:24:52 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37IFOpge011565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 15:24:51 GMT
Received: from [10.216.16.154] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 18 Aug
 2023 08:24:47 -0700
Message-ID: <c764901b-396e-b527-5b71-063408654c74@quicinc.com>
Date: Fri, 18 Aug 2023 20:54:43 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [linux-next:master 1937/6910]
 drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error:
 uninitialized symbol 'ret'.
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Manivannan Sadhasivam <mani@kernel.org>,
        Dan Carpenter
	<dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>,
        Md Sadre Alam
	<quic_mdalam@quicinc.com>, <lkp@intel.com>,
        <oe-kbuild-all@lists.linux.dev>,
        Linux Memory Management List <linux-mm@kvack.org>
References: <7ad1160b-5f8c-47af-a1c5-51b34f656fab@kadam.mountain>
 <20230804184550.0cb12369@xps-13>
 <3604e2ed-8d30-4f7b-9e56-7af5b23b2ac5@kadam.mountain>
 <20230804190750.3367a044@xps-13> <20230805065510.GA18650@thinkpad>
 <db088950-c25b-f0c0-851a-c5d56611c7c9@quicinc.com>
 <908ee5e8-6213-5685-7094-8c4b1282015c@quicinc.com>
 <20230807211458.3de7c627@xps-13>
 <4b8607e8-4df8-3b15-693f-7d7478caedac@quicinc.com>
 <20230818153319.4f2ca354@xps-13>
 <2fd50bec-b689-738a-297c-e0f9ad3cc402@quicinc.com>
 <20230818160308.261088fb@xps-13>
 <a9334ad2-d4e4-067c-89a1-e8e7adde0de9@quicinc.com>
In-Reply-To: <a9334ad2-d4e4-067c-89a1-e8e7adde0de9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aD3PLm2zcLiirJRSfPAPWue-gcdQTKRk
X-Proofpoint-ORIG-GUID: aD3PLm2zcLiirJRSfPAPWue-gcdQTKRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_19,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308180140

Hi Miquel,

<..>

>>>>>>
>>>>>> Look at your qcom_op_cmd_mapping, you don't even have a path for 
>>>>>> reads.
>>>>>> I bet something along:
>>>>>>     CMD_READ0:
>>>>>>         ret = XXX_OPCODE_READ;
>>>>>>         break;
>>>>>> will make it work.
>>>>>>
>>>>>> Please fix the driver and test with nandbiterrs -i. If this test 
>>>>>> works,
>>>>>> it is encouraging. Otherwise it is still broken.
>>>>>
>>>>>     ok understand. Will fix this up.
>>>>
>>>> This is urgent now. The driver in -next is broken, shall I revert
>>>> everything or will you test the above fix quickly?
>>>
>>>     While we are able to reproduce the issue, add path for
>>>     CMD_READ0/READ_START for IPQ platforms. All mtd tests including
>>>     nandbiterrs works fine.  But we are not able to get hold of a SDX
>>>     device where we could reproduce the issue to debug. We are working
>>>     offline with Manivannan for the SDX remote debug. Will keep you
>>>     updated here and if we are not able to solve this on SDX in next
>>>     couple of days, only way looks like revert and re-apply it for 6.7.
>>
>> If the READ path works on IPQ platforms it's already a huge step
>> forward, please send the fix on top of Mannivan series.
>>
>    ok, will send. Please confirm if its all fine.
>    There are more abstraction/common mode in the driver to be pulled
>    out, but that will do later.
> 
      Just now Alam posted this series for this.
       "[PATCH 0/3]mtd: rawnand: qcom: Fixes for exec_op".

Regards,
  Sricharan


>> Now, what is the issue with SDX?
> 
>     Looks like SDX device that Mani is having is a 4K nand device.
>     For some reason, after exec ops nand boot is broken on that board.
>     We applied the fixes we did on top of Manivannan series.
>     With that enumeration works, but still mount fails. But 4K nand
>     device boot on IPQ works fine. Problem is we do not have a SDX board
>     where we could debug that. We are trying to get a remote setup
>     enabled for this.
> 
> Regards,
>   Sricharan
