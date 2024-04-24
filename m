Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4104C156F30
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Apr 2024 06:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713940104; cv=none; b=lNnYz2jJvYngzT7OuSUYCVbxmPS0l6VJQKLv1Je/ZSytxsAptbZlF478X15eDTVPub2wW36cgN0tenacskfutT4AOwZs85gt6D8egeMJmJOJJ3Isv2iCd/VZbVzQ9uRXxSFWoSYjpJxzlK5HVMl6LwpQmNvvyP9cZdJWVkKCcDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713940104; c=relaxed/simple;
	bh=RjJ/ynGTB0AOtlxqX8QKWNLmIIpoEyLSgAJn+OvJws8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Phj6LGxW3oRoN0FYRjHAXvblrNyNWmGHJ0XVSlfi4aqnsmSgv4crE6qS4OZoozCMLXYT2/6c7c2r5EIDIHc1SKXfSdjzMN6DbAT/KsZ2mjTBmcutPJU37cN3R5YX/HjAS3NlQHl+/fXUqeZnRwanGifBI3xDhfOzK6HKIaEnnuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y2yzMzpR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y2yzMzpR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41a4f291f9dso23467715e9.2
        for <oe-kbuild@lists.linux.dev>; Tue, 23 Apr 2024 23:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713940100; x=1714544900; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkVAcaBjqkDWZAIL4vc+SZ6sTNCsVsKfK7+mih+QGWU=;
        b=Y2yzMzpRW+QTX3V4COxaADqkLhp1OwHoa9ss/TUWu9hnJPbtsz6hpTE38rPRK6BWHe
         KyZ0uokZi9kdRkIe/krH+D366T19yK+Z1CO5+BYxUK2gOtLn6+aP+jWm8wrvwlkpgaOX
         u4VT5aitPvh+viavYw8XuYKVodSSExaimQO62A+3BMpYxkKRY06VytueWAJbF8y8vuEr
         K/rhHFkN+ThAfak3hxSXto/USoT2c3e5WsfkCnvKRkzyLkNKrzXvqG4Geqcd2YPCrxRT
         fXHaYWsTByWAP0y2bF0kN5dC3iB1KDnkwoQ0WjFWYZnSW4VLBhGWcRbBtA19Si69SQEQ
         PZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713940100; x=1714544900;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkVAcaBjqkDWZAIL4vc+SZ6sTNCsVsKfK7+mih+QGWU=;
        b=i0kh9r4JeEbQWNsfw8IUQ2HAiaL+dNri0tS4aWe+9fM4ylCnA7jpaRld/8H1bn2Plj
         i/ijCeKy8greC4dPoSSW/En2cnpWSFG+1WVFab5jxb8ZRFXj9SfgA9ZjKuXPLfz/2lYH
         cmRvsnc+kFEKiD9GVikLVRkR2THkjWXsuY+xAiikps6Nvu+BHwVTa+K9fkP7ww+wYKVm
         s4vtp5USmGo15qB+gRCwFdwU/ZxbdLRCnLLtYXDL/wT01pT3iKZdIvZrCsWSoKfLXLLR
         48bFAYx7TdcbCNKP7qIysID0H9oCvSeo61EUPe4zdL+kQHdI+LXxRV4i5Sg3/1/RJEkN
         2ydA==
X-Gm-Message-State: AOJu0YzbQZgXqwg3jLhYIzTHfDc870zt3op8kKOYs/7q0KGqueF2N1UV
	EpYYezGwlhwVtz/WuSwLzc3dFBQNvqAejZJRxU5WxVgYM65lp/fdpYk1viduX9947up+bHgbnhT
	4
X-Google-Smtp-Source: AGHT+IFG2RK/ltTFm8U7OE3v060eusfCPLzMCGGAoNZGAXimI5J53LJYa0QgynM9AnKLVkklNsCPtw==
X-Received: by 2002:adf:f351:0:b0:347:a286:c136 with SMTP id e17-20020adff351000000b00347a286c136mr978357wrp.15.1713940099997;
        Tue, 23 Apr 2024 23:28:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j6-20020adff006000000b00349856b640bsm16304622wro.67.2024.04.23.23.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 23:28:19 -0700 (PDT)
Date: Wed, 24 Apr 2024 09:28:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Steve French <stfrench@microsoft.com>
Subject: fs/smb/server/smb2pdu.c:1992 smb2_tree_connect() error:
 uninitialized symbol 'share'.
Message-ID: <e9ead449-6ea6-4017-b26a-3a80ea6d4018@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d1ddab261f3e2af7c384dc02238784ce0cf9f98
commit: e9d8c2f95ab8acaf3f4d4a53682a4afa3c263692 ksmbd: add continuous availability share parameter
config: x86_64-randconfig-161-20240424 (https://download.01.org/0day-ci/archive/20240424/202404241435.Yxr6Wapq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404241435.Yxr6Wapq-lkp@intel.com/

New smatch warnings:
fs/smb/server/smb2pdu.c:1992 smb2_tree_connect() error: uninitialized symbol 'share'.

vim +/share +1992 fs/smb/server/smb2pdu.c

e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1921  int smb2_tree_connect(struct ksmbd_work *work)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1922  {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1923  	struct ksmbd_conn *conn = work->conn;
7b7d709ef7cf28 fs/smb/server/smb2pdu.c Namjae Jeon       2023-06-24  1924  	struct smb2_tree_connect_req *req;
7b7d709ef7cf28 fs/smb/server/smb2pdu.c Namjae Jeon       2023-06-24  1925  	struct smb2_tree_connect_rsp *rsp;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1926  	struct ksmbd_session *sess = work->sess;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1927  	char *treename = NULL, *name = NULL;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1928  	struct ksmbd_tree_conn_status status;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1929  	struct ksmbd_share_config *share;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1930  	int rc = -EINVAL;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1931  
7b7d709ef7cf28 fs/smb/server/smb2pdu.c Namjae Jeon       2023-06-24  1932  	WORK_BUFFERS(work, req, rsp);
7b7d709ef7cf28 fs/smb/server/smb2pdu.c Namjae Jeon       2023-06-24  1933  
c6cd2e8d2d9aa7 fs/smb/server/smb2pdu.c Namjae Jeon       2024-03-19  1934  	treename = smb_strndup_from_utf16((char *)req + le16_to_cpu(req->PathOffset),
070fb21e5912b6 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-26  1935  					  le16_to_cpu(req->PathLength), true,
070fb21e5912b6 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-26  1936  					  conn->local_nls);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1937  	if (IS_ERR(treename)) {
bde1694aecdb53 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-06-28  1938  		pr_err("treename is NULL\n");
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1939  		status.ret = KSMBD_TREE_CONN_STATUS_ERROR;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1940  		goto out_err1;
                                                                                        ^^^^^^^^^^^^^

e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1941  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1942  
16b5f54e30c1dd fs/ksmbd/smb2pdu.c      Atte Heikkilä     2022-09-15  1943  	name = ksmbd_extract_sharename(conn->um, treename);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1944  	if (IS_ERR(name)) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1945  		status.ret = KSMBD_TREE_CONN_STATUS_ERROR;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1946  		goto out_err1;
                                                                                        ^^^^^^^^^^^^^
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1947  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1948  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1949  	ksmbd_debug(SMB, "tree connect request for tree %s treename %s\n",
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1950  		    name, treename);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1951  
af7c39d971e43c fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-07-25  1952  	status = ksmbd_tree_conn_connect(conn, sess, name);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1953  	if (status.ret == KSMBD_TREE_CONN_STATUS_OK)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1954  		rsp->hdr.Id.SyncId.TreeId = cpu_to_le32(status.tree_conn->id);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1955  	else
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1956  		goto out_err1;

share is unitialized

e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1957  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1958  	share = status.tree_conn->share_conf;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1959  	if (test_share_config_flag(share, KSMBD_SHARE_FLAG_PIPE)) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1960  		ksmbd_debug(SMB, "IPC share path request\n");
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1961  		rsp->ShareType = SMB2_SHARE_TYPE_PIPE;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1962  		rsp->MaximalAccess = FILE_READ_DATA_LE | FILE_READ_EA_LE |
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1963  			FILE_EXECUTE_LE | FILE_READ_ATTRIBUTES_LE |
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1964  			FILE_DELETE_LE | FILE_READ_CONTROL_LE |
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1965  			FILE_WRITE_DAC_LE | FILE_WRITE_OWNER_LE |
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1966  			FILE_SYNCHRONIZE_LE;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1967  	} else {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1968  		rsp->ShareType = SMB2_SHARE_TYPE_DISK;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1969  		rsp->MaximalAccess = FILE_READ_DATA_LE | FILE_READ_EA_LE |
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1970  			FILE_EXECUTE_LE | FILE_READ_ATTRIBUTES_LE;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1971  		if (test_tree_conn_flag(status.tree_conn,
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1972  					KSMBD_TREE_CONN_FLAG_WRITABLE)) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1973  			rsp->MaximalAccess |= FILE_WRITE_DATA_LE |
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1974  				FILE_APPEND_DATA_LE | FILE_WRITE_EA_LE |
3aefd54da5ec6e fs/cifsd/smb2pdu.c      Wan Jiabing       2021-06-07  1975  				FILE_DELETE_LE | FILE_WRITE_ATTRIBUTES_LE |
3aefd54da5ec6e fs/cifsd/smb2pdu.c      Wan Jiabing       2021-06-07  1976  				FILE_DELETE_CHILD_LE | FILE_READ_CONTROL_LE |
3aefd54da5ec6e fs/cifsd/smb2pdu.c      Wan Jiabing       2021-06-07  1977  				FILE_WRITE_DAC_LE | FILE_WRITE_OWNER_LE |
3aefd54da5ec6e fs/cifsd/smb2pdu.c      Wan Jiabing       2021-06-07  1978  				FILE_SYNCHRONIZE_LE;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1979  		}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1980  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1981  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1982  	status.tree_conn->maximal_access = le32_to_cpu(rsp->MaximalAccess);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1983  	if (conn->posix_ext_supported)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1984  		status.tree_conn->posix_extensions = true;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1985  
33b235a6e6ebe0 fs/smb/server/smb2pdu.c Namjae Jeon       2023-10-05  1986  	write_lock(&sess->tree_conns_lock);
33b235a6e6ebe0 fs/smb/server/smb2pdu.c Namjae Jeon       2023-10-05  1987  	status.tree_conn->t_state = TREE_CONNECTED;
33b235a6e6ebe0 fs/smb/server/smb2pdu.c Namjae Jeon       2023-10-05  1988  	write_unlock(&sess->tree_conns_lock);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1989  	rsp->StructureSize = cpu_to_le16(16);
cdfb2fef522d0c fs/ksmbd/smb2pdu.c      Marios Makassikis 2022-12-23  1990  out_err1:
e9d8c2f95ab8ac fs/smb/server/smb2pdu.c Namjae Jeon       2024-04-20  1991  	if (server_conf.flags & KSMBD_GLOBAL_FLAG_DURABLE_HANDLE &&
e9d8c2f95ab8ac fs/smb/server/smb2pdu.c Namjae Jeon       2024-04-20 @1992  	    test_share_config_flag(share,
                                                                                                           ^^^^^

e9d8c2f95ab8ac fs/smb/server/smb2pdu.c Namjae Jeon       2024-04-20  1993  				   KSMBD_SHARE_FLAG_CONTINUOUS_AVAILABILITY))
e9d8c2f95ab8ac fs/smb/server/smb2pdu.c Namjae Jeon       2024-04-20  1994  		rsp->Capabilities = SMB2_SHARE_CAP_CONTINUOUS_AVAILABILITY;
e9d8c2f95ab8ac fs/smb/server/smb2pdu.c Namjae Jeon       2024-04-20  1995  	else
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1996  		rsp->Capabilities = 0;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1997  	rsp->Reserved = 0;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1998  	/* default manual caching */
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1999  	rsp->ShareFlags = SMB2_SHAREFLAG_MANUAL_CACHING;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2000  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

