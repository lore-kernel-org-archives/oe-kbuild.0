Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C5132C94A
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266551; cv=none; b=Lfn+cxY/xRvRzK9lDpmLcoizBfs1qj1sP5Y1UxBtooBAmIhgr3eqGXJfJWZaXZDW2QZHVbuJv+EQQKwcc8wDeLkJokJ/srXYNUrwAfcfFF2MYeF/mJQAoTnNC3BrOY3bXWB/sTxg7z6yJ84oMRDkAd3HVj5lvhapqrT2LAV76Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266551; c=relaxed/simple;
	bh=REkG/q/hE/YldadpVz9XvAQ8VWNYpuT8HuVV0Mlx1QM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W5FW9+RqHclhouTA9t9dOK30e0bkUbRHI+OGh7h7Pd5MtjNW09RfioB6Udq7t5xatrUkzaB4v0PKlXCD95uneT8BjV1vgDELm131Zt5Fia8dnsTx0pXODVxq/Pc5p5ffZhjkZUVmhrZKmb8iaeCEvuiFd1bs5ml57xtnbxoNtnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmJpGTtY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmJpGTtY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so54181585e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 01:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779266548; x=1779871348; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/oRr1HlTAN7zFGMwAsyfrHdBmm6CM1yJKGj97a480f0=;
        b=KmJpGTtY0kC1sSgmLuTqEsERD0lpZe3yRW0F8ucbwFzf0hbLn9Q0TOw4NQcvlLFDj+
         L/UX3++G05EYPpujDQ3Js25aKZmnz8O3hit5n1UROMCpMbax1TWemI9LvIXAuJ8x88wU
         Ixqws2NQEPUnaVr/JT9tilP4Uzglf1sE58f3bY3xjh6VntxfAV9hjuSLR3LAxsA0Qaf1
         8fUZIV6ecQ4dZ1szisk17cJmBHL8rTDRXcjCAwl6PyUuHRnhuozkNEwSfTvnfgZeZXvL
         he8heUDXBMCNwiSyP7ybRQrIcl3nxP3G/mEpLGrEJ2cXC/MXr++mcjs+bBkbSO7fCT2A
         gJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266548; x=1779871348;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/oRr1HlTAN7zFGMwAsyfrHdBmm6CM1yJKGj97a480f0=;
        b=TZVm+N8PxFLQUHRp/y0jFsoZt+X8swy5u4Lymy+EIXBOPtUTUEKKONIMIfFY5WUsz4
         wZ4fjvKrezyr2Rp6X9LfAWt/v/Wa4XONZq5quftW7knZKi6wZkuIoDyy83EPkOoBjuPT
         DcE+W/ddW9gEhdIPq5qwkosjRhcmuRYBKNwJ6mdH1EshNpcSOel/tUopQIDcHdq2FzOl
         XQz5pUp1ruqRaZEK0MV//Cwydv/pu8jGXhZY3icYGuiyXahEws6svC66LseAR6ZUfATq
         QjI2AXbgwzZKW4G7kWyn7owDuTh3Tk+0sBeXzn2+N1tw0+Jkl3AkTkNQOgb7k2lbWJm0
         JaGw==
X-Gm-Message-State: AOJu0YzcwYXhyuYq+NmdB/CbYcJj7B9C0QsRJ+AFxROLJ6qfUBtYVZJL
	7FVHVqVNilf5FlD1Do6UIkjSj3IPxIUDsM8eiKmak60tYanwxC3cyZwHus8K4Q==
X-Gm-Gg: Acq92OFNXgoDcEWMD8RJHT/vWfz0XC/ar3yVgxn7+oCTan+BV9Zd1Tx4exPFVaBkwCF
	jegaOxDUw21k7x91jSY8ZA26maAcrIXdc9P63KjFxH3eyHWcNdhIj635HiZ167dX+Z36C7MhDw+
	IvSEzCS6+W2sA69ETt8sGruuQwpO/LCgmpc+ZKIr6BbO2kJQoRx2/WB+THmNG/Odg8QfetzxqTM
	14mWazuKnRA2oGj/HtmmU/sbSVbK/Xf0v58JPedzlZMym8rCbcFQJhlVqKFzgCU+YLr+7RSEkqv
	xhG5RidOPRGJMxsExat4FsWceZptph8GYC3O2eEHDkTjMkSROBL5nf9iRJF/sIy8ZFJkvhGCvyP
	ffBSqgdmXqSKLO7EKfmNlnmbQniv9tQBcZqmPKl7LWViGo+fw9pNNghWSVI0JZVFavEkF16FMrO
	5byovhymUJRWxyPqq59aQRwkY=
X-Received: by 2002:a05:600c:6206:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-48fe60e79fdmr364436595e9.9.1779266547428;
        Wed, 20 May 2026 01:42:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2a878sm198063565e9.1.2026.05.20.01.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:42:26 -0700 (PDT)
Date: Wed, 20 May 2026 11:42:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 34/34] fs/netfs/direct_write.c:53
 netfs_rmw_read_one() warn: signedness bug returning '(-12)'
Message-ID: <202605201613.76Hj6Ulj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260520084223.0JhSGXI7rVDU6xsvDRhPB_kr-RdrkrsFZMaKcNIY9nU@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   13cee75c8b683f7c4382573f8c27adfbd49ffc47
commit: 13cee75c8b683f7c4382573f8c27adfbd49ffc47 [34/34] netfs: Support encryption on Unbuffered/DIO write
config: microblaze-randconfig-r072-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201613.76Hj6Ulj-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605201613.76Hj6Ulj-lkp@intel.com/

smatch warnings:
fs/netfs/direct_write.c:53 netfs_rmw_read_one() warn: signedness bug returning '(-12)'

vim +53 fs/netfs/direct_write.c

13cee75c8b683f David Howells 2026-05-16  16  static bool netfs_rmw_read_one(struct netfs_io_request *rreq, struct bvecq *bq)

This is a bool function.

13cee75c8b683f David Howells 2026-05-16  17  {
13cee75c8b683f David Howells 2026-05-16  18  	struct netfs_io_stream *stream = &rreq->io_streams[0];
13cee75c8b683f David Howells 2026-05-16  19  	size_t len = 0;
13cee75c8b683f David Howells 2026-05-16  20  	int ret = 0;
13cee75c8b683f David Howells 2026-05-16  21  
13cee75c8b683f David Howells 2026-05-16  22  	for (int i = 0; i < bq->nr_slots; i++)
13cee75c8b683f David Howells 2026-05-16  23  		len += bq->bv[i].bv_len;
13cee75c8b683f David Howells 2026-05-16  24  
13cee75c8b683f David Howells 2026-05-16  25  	rreq->start		= bq->fpos;
13cee75c8b683f David Howells 2026-05-16  26  	rreq->len		= len;
13cee75c8b683f David Howells 2026-05-16  27  	stream->issue_from	= bq->fpos;
13cee75c8b683f David Howells 2026-05-16  28  	stream->buffered	= len;
13cee75c8b683f David Howells 2026-05-16  29  
13cee75c8b683f David Howells 2026-05-16  30  	do {
13cee75c8b683f David Howells 2026-05-16  31  		struct netfs_io_subrequest *subreq;
13cee75c8b683f David Howells 2026-05-16  32  
13cee75c8b683f David Howells 2026-05-16  33  		subreq = netfs_alloc_subrequest(rreq, NETFS_DOWNLOAD_FROM_SERVER);
13cee75c8b683f David Howells 2026-05-16  34  		if (!subreq) {
13cee75c8b683f David Howells 2026-05-16  35  			ret = -ENOMEM;
                                                                ^^^^^^^^^^^^^
But it returns 0 on success and true on failue.

13cee75c8b683f David Howells 2026-05-16  36  			break;
13cee75c8b683f David Howells 2026-05-16  37  		}
13cee75c8b683f David Howells 2026-05-16  38  
13cee75c8b683f David Howells 2026-05-16  39  		subreq->start	= stream->issue_from;
13cee75c8b683f David Howells 2026-05-16  40  		subreq->len	= stream->buffered;
13cee75c8b683f David Howells 2026-05-16  41  
13cee75c8b683f David Howells 2026-05-16  42  		spin_lock(&rreq->lock);
13cee75c8b683f David Howells 2026-05-16  43  		list_add_tail(&subreq->rreq_link, &stream->subrequests);
13cee75c8b683f David Howells 2026-05-16  44  		trace_netfs_sreq(subreq, netfs_sreq_trace_added);
13cee75c8b683f David Howells 2026-05-16  45  		spin_unlock(&rreq->lock);
13cee75c8b683f David Howells 2026-05-16  46  
13cee75c8b683f David Howells 2026-05-16  47  		netfs_stat(&netfs_n_rh_download);
13cee75c8b683f David Howells 2026-05-16  48  		rreq->netfs_ops->issue_read(subreq);
13cee75c8b683f David Howells 2026-05-16  49  
13cee75c8b683f David Howells 2026-05-16  50  		cond_resched();
13cee75c8b683f David Howells 2026-05-16  51  	} while (stream->buffered > 0);
13cee75c8b683f David Howells 2026-05-16  52  
13cee75c8b683f David Howells 2026-05-16 @53  	return ret;
13cee75c8b683f David Howells 2026-05-16  54  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

