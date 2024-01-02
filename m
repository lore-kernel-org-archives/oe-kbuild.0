Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0564111A5
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jan 2024 14:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiXXx4WD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d560818b8so68781845e9.1
        for <oe-kbuild@lists.linux.dev>; Tue, 02 Jan 2024 06:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704205356; x=1704810156;
        h=dkim-signature:content-disposition:mime-version:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUpIPgnfWfICq3ZI8p1VYRjPAf4AX6ggEDVaj80BdYQ=;
        b=O1POHZdeOJypI58ya0P94AXlWBzdiuidnFP7r4HaFHuFIz89JUxYfjLzUU7sBeZ15P
         tFHOMLoj7dMW5vFkS36rhT9H8oGuzN89RInUrE8VDGDGjx+NFQN+tagDeAGvArqR3J61
         Rq9sX7RE5J01f/yEjDZAM1sDmx+kKycaZJrSx2tyL1UChtWZcTXucdcx3sYJ6aXE99sE
         iwIdu0gUprdbzkk+KUsBSk6bsuUEVvriUS80ImLKOD/pQNiWdbdpU2gWZpD9cX8v51Bn
         Vb0HcoqI3Q+d32FZzFNpdl1rPA0kUj+Z32g4vjjFAWlrZZjiJXkXvGC78ZqCCGu6Z4AZ
         zghw==
X-Gm-Message-State: AOJu0YxSOY4ks3oDDAt99Wqm5MN/cnelqijHRfB3Abb6APRLOIV72E4k
	mv0oECWUghGDjtBKDzia+lnEibPKPX1uyEmZDSoT9ih6nKw=
X-Google-Smtp-Source: AGHT+IGjZ6eiBEtxj3YgPfcUu3B1iDoLGZt+EM4y1bHlTAlAEX+BcGjqciUFDqt6JdIUZ0ehOEQ4Yg==
X-Received: by 2002:a05:600c:248:b0:40d:5fea:e563 with SMTP id 8-20020a05600c024800b0040d5feae563mr4297847wmj.29.1704205356334;
        Tue, 02 Jan 2024 06:22:36 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b0040d725a9967sm16941491wmo.11.2024.01.02.06.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:22:35 -0800 (PST)
Date: Tue, 2 Jan 2024 17:22:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 08/12] usb: yurex: Replace snprintf() with the safer
 scnprintf() variant
Message-ID: <d090f9dd-b06c-45cb-97e5-d8628faac6e9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received: from imap.gmail.com (74.125.71.109:993) by suswa with IMAP4-SSL
 getmail6 msgid:674269650/292773; 02 Jan 2024 06:54:49 -0000
Received: by 2002:a05:612c:202c:b0:43e:252:38f8 with SMTP id
 ff12csp396104vqb;        Sat, 16 Dec 2023 10:16:43 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:77e:fba3:7588 with SMTP id
 bq38-20020a05620a46a600b0077efba37588mr16471518qkb.128.1702750603054; Sat,
 16 Dec 2023 10:16:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702750603; cv=none;        d=google.com;
 s=arc-20160816;
 b=PwkIKfkhbwlOF2ck3egDSfl9gjtDnFGLf/syEQPrux9U+hgbejB9zPsSRQFM+UcuK6
 GPQdc9lcPyEGLNBGqvKdxhkHScBDn8GlUhvgZ30wtikvaZPoKoUCDW+C1sqWtlg9kAU6
 MfciLBlSI9IBcyoqRIKCBV2dkywztNlLp+10Peqr1D+umbyc2JtAJLouDxyPrEqNzkhg
 8RrmpA9TKg6TQjOi7X8XXPo+ZJIrvQQnaLf6gWIGqcz1u/Q0VzWM5/+9Z/PHITuNwHot
 NPemjo+/lXPsgzgpuHhm7JUraibmngVrmx6JQyV9e54mR0+929X+E/36TD9B8TRVBi3q X+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :dkim-signature; bh=Ug8UNqCtIytJIVWcmyMxLNwVWOo4hIrxZ/k9U39N+OM=;
 fh=STwU/6nAwSVI2oUzRWkoH/BhmoKW+LI2Ifd8kl7IM00=;
 b=kSk/ZPAkgHMXheR/R7KrZwDy5L58iCZUpO0SC12yKzQVb6I0hNJ4yOcernfM6FKC46
 0m8/lhtkuiWU0Pnsm0M2Km6/fSJrhHYksOAhv/sTCO4xz/jJgF41pOLbUsuvMCKZS67C
 NIrOugaK+guo5rCxttJCYIq2BIn434Cp9Zg/C2QT0TF22yPq4Xxo3ajQ2jmT4nKKD0vl
 QrUewzYkyZcY4hRrjWrvtR6FXAKrPsBf2a/NftX+24xjnGeovrkj8RBZXSJynNvLutvx
 IywY6ctIqf6KEJKPV67DHXrHEn6KNGIVe0huFrhE94xR5InOJYT49qfGOsaoKqhO0R9G cz1A==
ARC-Authentication-Results: i=1; mx.google.com;       dkim=pass
 header.i=@intel.com header.s=Intel header.b=FiXXx4WD;       spf=pass
 (google.com: domain of lkp@intel.com designates 198.175.65.10 as permitted
 sender) smtp.mailfrom=lkp@intel.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=intel.com
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10]) by
 mx.google.com with ESMTPS id
 q20-20020a05620a0d9400b0077f9112aa36si9833265qkl.69.2023.12.16.10.16.42 for
 <dan.carpenter@linaro.org>        (version=TLS1_2
 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);        Sat, 16 Dec 2023
 10:16:43 -0800 (PST)
Received-SPF: pass (google.com: domain of lkp@intel.com designates
 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;  d=intel.com;
 i=@intel.com; q=dns/txt; s=Intel;  t=1702750603; x=1734286603;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=qBUjZv2xkaH9jxGZVvUmTcd9tYeAsE9mTba6tm/unfc=;
 b=FiXXx4WD79Kcf9qpQIIoX5dPx9s7MeufeKonBsJbnf6t6x2jei2dBoz6
 ZUaRbkNOY1H+jUjMwK4DaX2gOjBFivYUVHiO6RxdTPCN0FSyfuRtjlL7V
 WL1l+dyXdSlXK+aWEWpgvTQLAnGJdNFkKiYJdd618gnB/MX8UUpD817pH
 WR/jzjiln9YZ9RMLpH05QJF8rbzR6m2iSzSTecWgYvvRyl4Csh1xhtmr3
 eshCREFqRg9P5IgtlojXHwmLKWGYozMeGvO66C2P0jnxpJIvmaOQA4Me7
 4gdXKXRlES1IbgMAvzoamJIJyXZq3Nh8VOuMVElHPOCD53luteNInG+Ep   g==;
Received: from fmsmga007.fm.intel.com ([10.253.24.52])  by
 orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec
 2023 10:16:43 -0800
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe)
 ([10.239.97.151])  by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2023
 10:16:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96) (envelope-from
 <lkp@intel.com>) id 1rEZDK-00020U-1V; Sat, 16 Dec 2023 18:16:38 +0000

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231213164246.1021885-9-lee@kernel.org>
References: <20231213164246.1021885-9-lee@kernel.org>
TO: Lee Jones <lee@kernel.org>

Hi Lee,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lee-Jones/usb-gadget-configfs-Replace-snprintf-with-the-safer-scnprintf-variant/20231214-004543
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231213164246.1021885-9-lee%40kernel.org
patch subject: [PATCH 08/12] usb: yurex: Replace snprintf() with the safer scnprintf() variant
config: riscv-randconfig-r081-20231216 (https://download.01.org/0day-ci/archive/20231217/202312170252.3udgrIcP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312170252.3udgrIcP-lkp@intel.com/

smatch warnings:
drivers/usb/misc/yurex.c:425 yurex_read() warn: inconsistent returns '&dev->io_mutex'.

vim +425 drivers/usb/misc/yurex.c

6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  400  
1cc373c654acde Sudip Mukherjee  2014-10-10  401  static ssize_t yurex_read(struct file *file, char __user *buffer, size_t count,
1cc373c654acde Sudip Mukherjee  2014-10-10  402  			  loff_t *ppos)
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  403  {
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  404  	struct usb_yurex *dev;
f1e255d60ae66a Jann Horn        2018-07-06  405  	int len = 0;
d9c494521b9f1e Lee Jones        2023-12-13  406  	char in_buffer[MAX_S64_STRLEN];
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  407  	unsigned long flags;
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  408  
113ad911ad4a1c Arjun Sreedharan 2014-08-19  409  	dev = file->private_data;
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  410  
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  411  	mutex_lock(&dev->io_mutex);
aafb00a977cf7d Johan Hovold     2019-10-09  412  	if (dev->disconnected) {		/* already disconnected */
f1e255d60ae66a Jann Horn        2018-07-06  413  		mutex_unlock(&dev->io_mutex);
f1e255d60ae66a Jann Horn        2018-07-06  414  		return -ENODEV;
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  415  	}
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  416  
d9c494521b9f1e Lee Jones        2023-12-13  417  	if (WARN_ON_ONCE(dev->bbu > S64_MAX || dev->bbu < S64_MIN))
d9c494521b9f1e Lee Jones        2023-12-13  418  		return -EIO;
d9c494521b9f1e Lee Jones        2023-12-13  419  
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  420  	spin_lock_irqsave(&dev->lock, flags);
d9c494521b9f1e Lee Jones        2023-12-13  421  	scnprintf(in_buffer, MAX_S64_STRLEN, "%lld\n", dev->bbu);
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  422  	spin_unlock_irqrestore(&dev->lock, flags);
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  423  	mutex_unlock(&dev->io_mutex);
f1e255d60ae66a Jann Horn        2018-07-06  424  
f1e255d60ae66a Jann Horn        2018-07-06 @425  	return simple_read_from_buffer(buffer, count, ppos, in_buffer, len);
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  426  }
6bc235a2e24a5e Tomoki Sekiyama  2010-09-29  427  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Date: Sat, 16 Dec 2023 12:20:38 -0800
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Tree Davies
 <tdavies@darkphysics.net>
Subject: [PATCH] Staging: rtl8192e: rename linked list reference: List
Message-Id: <20231216202038.10777-1-tdavies@darkphysics.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8

Rename variable List to list, to fix Avoid CamelCase checkpatch warning.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TS.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 78 +++++++++++------------
 drivers/staging/rtl8192e/rtllib.h         |  2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 30 ++++-----
 4 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index 31f7cfbb3aa5..5b0e4cb572d2 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -17,7 +17,7 @@ enum tr_select {
 };
 
 struct ts_common_info {
-	struct list_head		List;
+	struct list_head		list;
 	u8				addr[ETH_ALEN];
 	struct qos_tsinfo tspec;
 };
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index bec73bc53dd0..86db56f3900d 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -25,7 +25,7 @@ static void RxPktPendingTimeout(struct timer_list *t)
 		while (!list_empty(&ts->rx_pending_pkt_list)) {
 			pReorderEntry = (struct rx_reorder_entry *)
 					list_entry(ts->rx_pending_pkt_list.prev,
-					struct rx_reorder_entry, List);
+					struct rx_reorder_entry, list);
 			if (index == 0)
 				ts->rx_indicate_seq = pReorderEntry->SeqNum;
 
@@ -33,7 +33,7 @@ static void RxPktPendingTimeout(struct timer_list *t)
 				    ts->rx_indicate_seq) ||
 			    SN_EQUAL(pReorderEntry->SeqNum,
 				     ts->rx_indicate_seq)) {
-				list_del_init(&pReorderEntry->List);
+				list_del_init(&pReorderEntry->list);
 
 				if (SN_EQUAL(pReorderEntry->SeqNum,
 				    ts->rx_indicate_seq))
@@ -47,7 +47,7 @@ static void RxPktPendingTimeout(struct timer_list *t)
 							 pReorderEntry->prxb;
 				index++;
 
-				list_add_tail(&pReorderEntry->List,
+				list_add_tail(&pReorderEntry->list,
 					      &ieee->RxReorder_Unused_List);
 			} else {
 				bPktInBuf = true;
@@ -138,7 +138,7 @@ void rtllib_ts_init(struct rtllib_device *ieee)
 			    rtllib_tx_ba_inact_timeout, 0);
 
 		ResetTxTsEntry(pTxTS);
-		list_add_tail(&pTxTS->ts_common_info.List,
+		list_add_tail(&pTxTS->ts_common_info.list,
 				&ieee->Tx_TS_Unused_List);
 		pTxTS++;
 	}
@@ -155,13 +155,13 @@ void rtllib_ts_init(struct rtllib_device *ieee)
 		timer_setup(&rxts->rx_pkt_pending_timer, RxPktPendingTimeout, 0);
 
 		ResetRxTsEntry(rxts);
-		list_add_tail(&rxts->ts_common_info.List,
+		list_add_tail(&rxts->ts_common_info.list,
 			      &ieee->Rx_TS_Unused_List);
 		rxts++;
 	}
 	INIT_LIST_HEAD(&ieee->RxReorder_Unused_List);
 	for (count = 0; count < REORDER_ENTRY_NUM; count++) {
-		list_add_tail(&pRxReorderEntry->List,
+		list_add_tail(&pRxReorderEntry->list,
 			      &ieee->RxReorder_Unused_List);
 		if (count == (REORDER_ENTRY_NUM - 1))
 			break;
@@ -196,17 +196,17 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 	for (dir = 0; dir <= DIR_BI_DIR; dir++) {
 		if (!search_dir[dir])
 			continue;
-		list_for_each_entry(pRet, psearch_list, List) {
+		list_for_each_entry(pRet, psearch_list, list) {
 			if (memcmp(pRet->addr, addr, 6) == 0 &&
 			    pRet->tspec.ucTSID == TID &&
 			    pRet->tspec.ucDirection == dir)
 				break;
 		}
-		if (&pRet->List  != psearch_list)
+		if (&pRet->list  != psearch_list)
 			break;
 	}
 
-	if (pRet && &pRet->List  != psearch_list)
+	if (pRet && &pRet->list  != psearch_list)
 		return pRet;
 	return NULL;
 }
@@ -286,8 +286,8 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 
 	if (!list_empty(pUnusedList)) {
 		(*ppTS) = list_entry(pUnusedList->next,
-			  struct ts_common_info, List);
-		list_del_init(&(*ppTS)->List);
+			  struct ts_common_info, list);
+		list_del_init(&(*ppTS)->list);
 		if (TxRxSelect == TX_DIR) {
 			struct tx_ts_record *tmp =
 				container_of(*ppTS,
@@ -309,7 +309,7 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 		ts_info->ucDirection = Dir;
 
 		MakeTSEntry(*ppTS, addr, &tspec);
-		list_add_tail(&((*ppTS)->List), pAddmitList);
+		list_add_tail(&((*ppTS)->list), pAddmitList);
 
 		return true;
 	}
@@ -335,10 +335,10 @@ static void RemoveTsEntry(struct rtllib_device *ieee,
 		while (!list_empty(&ts->rx_pending_pkt_list)) {
 			pRxReorderEntry = (struct rx_reorder_entry *)
 					list_entry(ts->rx_pending_pkt_list.prev,
-					struct rx_reorder_entry, List);
+					struct rx_reorder_entry, list);
 			netdev_dbg(ieee->dev,  "%s(): Delete SeqNum %d!\n",
 				   __func__, pRxReorderEntry->SeqNum);
-			list_del_init(&pRxReorderEntry->List);
+			list_del_init(&pRxReorderEntry->list);
 			{
 				int i = 0;
 				struct rtllib_rxb *prxb = pRxReorderEntry->prxb;
@@ -350,7 +350,7 @@ static void RemoveTsEntry(struct rtllib_device *ieee,
 				kfree(prxb);
 				prxb = NULL;
 			}
-			list_add_tail(&pRxReorderEntry->List,
+			list_add_tail(&pRxReorderEntry->list,
 				      &ieee->RxReorder_Unused_List);
 		}
 	} else {
@@ -366,37 +366,37 @@ void RemovePeerTS(struct rtllib_device *ieee, u8 *addr)
 
 	netdev_info(ieee->dev, "===========>%s, %pM\n", __func__, addr);
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Tx_TS_Pending_List, List) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->Tx_TS_Pending_List, list) {
 		if (memcmp(ts->addr, addr, 6) == 0) {
 			RemoveTsEntry(ieee, ts, TX_DIR);
-			list_del_init(&ts->List);
-			list_add_tail(&ts->List, &ieee->Tx_TS_Unused_List);
+			list_del_init(&ts->list);
+			list_add_tail(&ts->list, &ieee->Tx_TS_Unused_List);
 		}
 	}
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Tx_TS_Admit_List, List) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->Tx_TS_Admit_List, list) {
 		if (memcmp(ts->addr, addr, 6) == 0) {
 			netdev_info(ieee->dev,
 				    "====>remove Tx_TS_admin_list\n");
 			RemoveTsEntry(ieee, ts, TX_DIR);
-			list_del_init(&ts->List);
-			list_add_tail(&ts->List, &ieee->Tx_TS_Unused_List);
+			list_del_init(&ts->list);
+			list_add_tail(&ts->list, &ieee->Tx_TS_Unused_List);
 		}
 	}
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Rx_TS_Pending_List, List) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->Rx_TS_Pending_List, list) {
 		if (memcmp(ts->addr, addr, 6) == 0) {
 			RemoveTsEntry(ieee, ts, RX_DIR);
-			list_del_init(&ts->List);
-			list_add_tail(&ts->List, &ieee->Rx_TS_Unused_List);
+			list_del_init(&ts->list);
+			list_add_tail(&ts->list, &ieee->Rx_TS_Unused_List);
 		}
 	}
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Rx_TS_Admit_List, List) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->Rx_TS_Admit_List, list) {
 		if (memcmp(ts->addr, addr, 6) == 0) {
 			RemoveTsEntry(ieee, ts, RX_DIR);
-			list_del_init(&ts->List);
-			list_add_tail(&ts->List, &ieee->Rx_TS_Unused_List);
+			list_del_init(&ts->list);
+			list_add_tail(&ts->list, &ieee->Rx_TS_Unused_List);
 		}
 	}
 }
@@ -406,28 +406,28 @@ void RemoveAllTS(struct rtllib_device *ieee)
 {
 	struct ts_common_info *ts, *pTmpTS;
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Tx_TS_Pending_List, List) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->Tx_TS_Pending_List, list) {
 		RemoveTsEntry(ieee, ts, TX_DIR);
-		list_del_init(&ts->List);
-		list_add_tail(&ts->List, &ieee->Tx_TS_Unused_List);
+		list_del_init(&ts->list);
+		list_add_tail(&ts->list, &ieee->Tx_TS_Unused_List);
 	}
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Tx_TS_Admit_List, List) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->Tx_TS_Admit_List, list) {
 		RemoveTsEntry(ieee, ts, TX_DIR);
-		list_del_init(&ts->List);
-		list_add_tail(&ts->List, &ieee->Tx_TS_Unused_List);
+		list_del_init(&ts->list);
+		list_add_tail(&ts->list, &ieee->Tx_TS_Unused_List);
 	}
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Rx_TS_Pending_List, List) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->Rx_TS_Pending_List, list) {
 		RemoveTsEntry(ieee, ts, RX_DIR);
-		list_del_init(&ts->List);
-		list_add_tail(&ts->List, &ieee->Rx_TS_Unused_List);
+		list_del_init(&ts->list);
+		list_add_tail(&ts->list, &ieee->Rx_TS_Unused_List);
 	}
 
-	list_for_each_entry_safe(ts, pTmpTS, &ieee->Rx_TS_Admit_List, List) {
+	list_for_each_entry_safe(ts, pTmpTS, &ieee->Rx_TS_Admit_List, list) {
 		RemoveTsEntry(ieee, ts, RX_DIR);
-		list_del_init(&ts->List);
-		list_add_tail(&ts->List, &ieee->Rx_TS_Unused_List);
+		list_del_init(&ts->list);
+		list_add_tail(&ts->list, &ieee->Rx_TS_Unused_List);
 	}
 }
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0b4a6ded257a..303a2d279e86 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1042,7 +1042,7 @@ struct bandwidth_autoswitch {
 #define REORDER_WIN_SIZE	128
 #define REORDER_ENTRY_NUM	128
 struct rx_reorder_entry {
-	struct list_head	List;
+	struct list_head	list;
 	u16			SeqNum;
 	struct rtllib_rxb *prxb;
 };
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index d9517dbc5593..b22ae40fb71b 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -412,19 +412,19 @@ static bool AddReorderEntry(struct rx_ts_record *ts,
 	while (pList->next != &ts->rx_pending_pkt_list) {
 		if (SN_LESS(pReorderEntry->SeqNum, ((struct rx_reorder_entry *)
 		    list_entry(pList->next, struct rx_reorder_entry,
-		    List))->SeqNum))
+		    list))->SeqNum))
 			pList = pList->next;
 		else if (SN_EQUAL(pReorderEntry->SeqNum,
 			((struct rx_reorder_entry *)list_entry(pList->next,
-			struct rx_reorder_entry, List))->SeqNum))
+			struct rx_reorder_entry, list))->SeqNum))
 			return false;
 		else
 			break;
 	}
-	pReorderEntry->List.next = pList->next;
-	pReorderEntry->List.next->prev = &pReorderEntry->List;
-	pReorderEntry->List.prev = pList;
-	pList->next = &pReorderEntry->List;
+	pReorderEntry->list.next = pList->next;
+	pReorderEntry->list.next->prev = &pReorderEntry->list;
+	pReorderEntry->list.prev = pList;
+	pList->next = &pReorderEntry->list;
 
 	return true;
 }
@@ -505,15 +505,15 @@ void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
 
 		pRxReorderEntry = (struct rx_reorder_entry *)
 				  list_entry(ts->rx_pending_pkt_list.prev,
-					     struct rx_reorder_entry, List);
+					     struct rx_reorder_entry, list);
 		netdev_dbg(ieee->dev, "%s(): Indicate SeqNum %d!\n", __func__,
 			   pRxReorderEntry->SeqNum);
-		list_del_init(&pRxReorderEntry->List);
+		list_del_init(&pRxReorderEntry->list);
 
 		ieee->RfdArray[RfdCnt] = pRxReorderEntry->prxb;
 
 		RfdCnt = RfdCnt + 1;
-		list_add_tail(&pRxReorderEntry->List,
+		list_add_tail(&pRxReorderEntry->list,
 			      &ieee->RxReorder_Unused_List);
 	}
 	rtllib_indicate_packets(ieee, ieee->RfdArray, RfdCnt);
@@ -602,8 +602,8 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 		if (!list_empty(&ieee->RxReorder_Unused_List)) {
 			pReorderEntry = (struct rx_reorder_entry *)
 					list_entry(ieee->RxReorder_Unused_List.next,
-					struct rx_reorder_entry, List);
-			list_del_init(&pReorderEntry->List);
+					struct rx_reorder_entry, list);
+			list_del_init(&pReorderEntry->list);
 
 			/* Make a reorder entry and insert
 			 * into a the packet list.
@@ -618,7 +618,7 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 					   "%s(): Duplicate packet is dropped. IndicateSeq: %d, NewSeq: %d\n",
 					   __func__, ts->rx_indicate_seq,
 					   SeqNum);
-				list_add_tail(&pReorderEntry->List,
+				list_add_tail(&pReorderEntry->list,
 					      &ieee->RxReorder_Unused_List);
 
 				for (i = 0; i < prxb->nr_subframes; i++)
@@ -658,7 +658,7 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 		pReorderEntry = (struct rx_reorder_entry *)
 					list_entry(ts->rx_pending_pkt_list.prev,
 						   struct rx_reorder_entry,
-						   List);
+						   list);
 		if (SN_LESS(pReorderEntry->SeqNum, ts->rx_indicate_seq) ||
 		    SN_EQUAL(pReorderEntry->SeqNum, ts->rx_indicate_seq)) {
 			/* This protect struct buffer from overflow. */
@@ -670,7 +670,7 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 				break;
 			}
 
-			list_del_init(&pReorderEntry->List);
+			list_del_init(&pReorderEntry->list);
 
 			if (SN_EQUAL(pReorderEntry->SeqNum, ts->rx_indicate_seq))
 				ts->rx_indicate_seq = (ts->rx_indicate_seq + 1) %
@@ -681,7 +681,7 @@ static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 				   __func__, pReorderEntry->SeqNum);
 			index++;
 
-			list_add_tail(&pReorderEntry->List,
+			list_add_tail(&pReorderEntry->list,
 				      &ieee->RxReorder_Unused_List);
 		} else {
 			bPktInBuf = true;
-- 
2.39.2

