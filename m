Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C496FBFD;
	Mon,  7 Aug 2023 18:54:36 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 377IPHdW003924;
	Mon, 7 Aug 2023 18:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ufBJjfmsH1ibKWRRPXaXuhT590e8e3sWnifglozVcvw=;
 b=VrzTH938p01zCU3UCF6BYlzrpS9YO65hM9O67x3aS7aHNM0XG15/VDDfYnZeZCFUMoEh
 QF2H3IZk9Bo2jvruhonqWFQfUgHqh8q39hsFZ1Hr+S31vW340n39jeCZBrfsGyqkUb6Q
 0d99xvFq7Ld5M2i5SffPKgOcEdHzsKh369IkBLy0zTIPiZevVqONyHE3u/Ve0mY6buKn
 Cj0YkPaimAITP4KQkbiFFmPr7mWxSM3UtJVgqJFbiTxS67z6yFk/Y3tUudepIo2qqDhD
 1x8WoJ/K7XvolLA3WapcTzdGGi1uzcswYHmaKQSXq++XZJr3pT/WfAYrjnMFGO+QpTQC 5g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sax18s60g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 18:54:25 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 377IsFe4011622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Aug 2023 18:54:15 GMT
Received: from [10.216.1.26] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 11:54:12 -0700
Message-ID: <908ee5e8-6213-5685-7094-8c4b1282015c@quicinc.com>
Date: Tue, 8 Aug 2023 00:24:08 +0530
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
 <db088950-c25b-f0c0-851a-c5d56611c7c9@quicinc.com>
In-Reply-To: <db088950-c25b-f0c0-851a-c5d56611c7c9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5qFjSROlZnnUwUa6g_96jdKieDgwOp5a
X-Proofpoint-ORIG-GUID: 5qFjSROlZnnUwUa6g_96jdKieDgwOp5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_21,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070173

Hi Mani/Miquel,

On 8/6/2023 1:28 PM, Sricharan Ramabadhran wrote:
> Hi Miquel/Mani/Dan,
> 
> <..>
> 
>>>>> The || should be &&, otherwise it cannot work, or am I missing
>>>>> something?
>>>>
>>>> Yeah.  That's how this bug normally looks like.  NAND_OP_CMD_INSTR
>>>> always returns -ENOTSUPP.
>>>>
>>
>> Yes, this is a bug.
>>
>> I didn't get a chance to review the exec_op conversion series (blame 
>> myself).
>> Now I see scope for a cleaup series :/
>>
>> Let me spin something by the end of today.
>>
>    Thanks a lot Mani for the quick fixes. Will test it.
>    Sorry it was a holiday for us past few days, so just checked this.
> 
> Regards,
>   Sricharan

  With this series applied on linux-next, started seeing the below
  messages flooded on console while doing mtd r/w.
  "xxx "Opcode not supported: 0"

  opcode '0' corresponds to NAND_CMD_READ0. This command inturn was
  invoked from qcom_nandc.c driver from below places. For read/write_page
  driver does not use the exec ops. Hence these calls just ends up
  being -ENOTSUPP and ignored. So removed their invocations.
  If this is fine, can this be added to your series ? (will send
  git-format patch to add to your cleanup series). So far, tested
  mtd raw/block read/writes and all works fine. Will do further tests
  as well.

--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1470,7 +1470,6 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, 
struct nand_chip *chip,
         int ret, reg_off = FLASH_BUF_ACC, read_loc = 0;
         int raw_cw = cw;

-       nand_read_page_op(chip, page, 0, NULL, 0);
         host->use_ecc = false;

         if (nandc->props->qpic_v2)
@@ -1890,7 +1889,6 @@ static int qcom_nandc_read_page(struct nand_chip 
*chip, u8 *buf,
         if (host->nr_boot_partitions)
                 qcom_nandc_codeword_fixup(host, page);

-       nand_read_page_op(chip, page, 0, NULL, 0);
         nandc->buf_count = 0;
         nandc->buf_start = 0;
         host->use_ecc = true;
@@ -1965,8 +1963,6 @@ static int qcom_nandc_write_page(struct nand_chip 
*chip, const u8 *buf,
         if (host->nr_boot_partitions)
                 qcom_nandc_codeword_fixup(host, page);

-       nand_prog_page_begin_op(chip, page, 0, NULL, 0);
-
         set_address(host, 0, page);
         nandc->buf_count = 0;
         nandc->buf_start = 0;
@@ -2039,7 +2035,6 @@ static int qcom_nandc_write_page_raw(struct 
nand_chip *chip,
         if (host->nr_boot_partitions)
                 qcom_nandc_codeword_fixup(host, page);

-       nand_prog_page_begin_op(chip, page, 0, NULL, 0);
         clear_read_regs(nandc);
         clear_bam_transaction(nandc);


Regards,
  Sricharan
