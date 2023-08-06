Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE541FAF;
	Sun,  6 Aug 2023 07:59:47 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3767tD1b014648;
	Sun, 6 Aug 2023 07:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cs7nSlSz1/Yjrkm/7/96d76Y2+TH3uL8yuusdSW2KAA=;
 b=jdD9wc9XGYc87rLoEOB8DZfFM3iKO9M3k9SADjDuHyYai8f9sC2TryagUu/Y6r4+PiP0
 ugZ6L6vceyDKnnByCP+8QYLn0CWDyMuaweQD9Zp7S7+dc4qOWBi4djPHOD9895Hnm3AB
 Y78/AfnFZqXF4AGGT/5KQQdAlPI+x3XZA4Z4r/oKxnBI3pcGUhkiyo5bGN/9pSurd6Ze
 bO5uYrWYjZwBBZVUwot07ayGuCq2mQJsjAHsBI8impNIlhxJwwxqbNgksFxXqPt0VLn5
 HdFCpOmH78IpBTdFjMuFlpkcS60IANVrtTfrfaxrxuUekBtlXFi2X3bHXQ+GtrPVexsT ag== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s9dcy9f75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Aug 2023 07:59:25 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3767x4lF005671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 6 Aug 2023 07:59:04 GMT
Received: from [10.216.26.89] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Sun, 6 Aug
 2023 00:59:00 -0700
Message-ID: <db088950-c25b-f0c0-851a-c5d56611c7c9@quicinc.com>
Date: Sun, 6 Aug 2023 13:28:57 +0530
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
To: Manivannan Sadhasivam <mani@kernel.org>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: Dan Carpenter <dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>,
        "Md
 Sadre Alam" <quic_mdalam@quicinc.com>, <lkp@intel.com>,
        <oe-kbuild-all@lists.linux.dev>,
        Linux Memory Management List
	<linux-mm@kvack.org>
References: <7ad1160b-5f8c-47af-a1c5-51b34f656fab@kadam.mountain>
 <20230804184550.0cb12369@xps-13>
 <3604e2ed-8d30-4f7b-9e56-7af5b23b2ac5@kadam.mountain>
 <20230804190750.3367a044@xps-13> <20230805065510.GA18650@thinkpad>
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <20230805065510.GA18650@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xiT3bHTkG0DYvVPnq4Lt03M_P_EB9nIG
X-Proofpoint-GUID: xiT3bHTkG0DYvVPnq4Lt03M_P_EB9nIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-06_03,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 impostorscore=0 mlxlogscore=867 suspectscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308060075

Hi Miquel/Mani/Dan,

<..>

>>>> The || should be &&, otherwise it cannot work, or am I missing
>>>> something?
>>>
>>> Yeah.  That's how this bug normally looks like.  NAND_OP_CMD_INSTR
>>> always returns -ENOTSUPP.
>>>
> 
> Yes, this is a bug.
> 
> I didn't get a chance to review the exec_op conversion series (blame myself).
> Now I see scope for a cleaup series :/
> 
> Let me spin something by the end of today.
> 
   Thanks a lot Mani for the quick fixes. Will test it.
   Sorry it was a holiday for us past few days, so just checked this.

Regards,
  Sricharan
