Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799AD1D556
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Apr 2024 06:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712299476; cv=none; b=OEawO3B01IfCysASknyXqYcRjigsqMASrP/6JY9F8y8oMc/NlhzKn2X34QM6ygMGECCGiKVk7URQUy42OTc1fBi5ACeuubqEKkG+42Xl4y/7zu5fzYwQZfM9f3XqzBip29BXcbDn+NjwKXvVQkTbo1K2rRCqHfYPT78N9ogGBHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712299476; c=relaxed/simple;
	bh=YJmH+h7H9M7nv3lu+l6dVYM39CBGSMwexCTbor4Qjbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bT2iU7g0oOvnLfNkTfdnCNahQhtIP3+FxmPbKTxhEEUqScby+PiGZZiOa4RKtaDRUzWH4SlV13h5muVF/4o0IKWffzuZfLVErTztQ2dIYDMpsMgWZQducPQhxviZVmscjqeWqN4F6WYSc/WF0Su64XunntORSUihr7UFjCa0/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mPbZVel6; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPbZVel6"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d718efedb2so30550541fa.0
        for <oe-kbuild@lists.linux.dev>; Thu, 04 Apr 2024 23:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712299472; x=1712904272; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IsLlr2oPSdmLwFf0BCT91wHONVR1VBOvbRLU+KDTOps=;
        b=mPbZVel6KyCq4IFoZguNnAsyyEG+I41mEEzPZTCUdsNfTRd3qqQ5Gz8GsAoOyYqX2/
         DOHD2gz06v0HG2NmkmaC9sjwCmDU242+OjT1TTFPIVHmvdQ7AXi0pZwoeu5aBti5PgbF
         46xQ6FeAH6JACFyjO6sY1uKbkJZv/TAVCYb971FBjKKrDozEM0dUvw18uYwNwwjPtrR4
         pUlpnELv+En8hzyuNnE4lE2ZpaksXLWuPB3x9nxRE7YSg2IIa49LPptpLowozcu2ZGzA
         FVZI86erQC+7Yu6fEld4/OtXM5ga/F/YmO24bRCyQMEWYiD00wtMoYb+tJozLdrbCA0p
         4Jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712299472; x=1712904272;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsLlr2oPSdmLwFf0BCT91wHONVR1VBOvbRLU+KDTOps=;
        b=hQdGzTOXjVX5nL9r7klmC+xx3KBkiSuyaUPtpS4Mz2thMmXzU3bPZTk5hR92JXQxf0
         SVSVInYXOGqJN6+B7sg0SMoHMfSW1J8IvUxNZkcHXQR6XP58s445GOBb7cLieW7rr2K3
         PpElEeI7QziaJX2+Ew/7d9Qin5tvIazNzVQNmyk9EhvigjSlumVzmmQ3X4SyvPJWuNLo
         3kSxHWzfWYf3j+cDx+CGlpoeWb3Fd7yxhFT00d9ntdlSe3ySVaxkPhjQE/FmIe6Btnav
         85o/C7X6a0eSH0vG1kBMaDG8GUzKP7+SXLm677zcQACxQ26S7Z7oT3vbZuPDPSccguNX
         ZF3Q==
X-Gm-Message-State: AOJu0YxeU/j861vIR8u6UfbXQxeE+YPi22KO0GPYUM4EXHz+o/50eNov
	Dh4ykxRPZwv6XKTSjYspZAeZSZ43Fd7EnvQqWy4a+gi2m4QI9YrtAEpWHjM5/fzU7vmiBFOd25K
	d
X-Google-Smtp-Source: AGHT+IEk/sNj9mizgaXwf4IF1lG0EwujTvvXhHkPWVXm1ykqubhH7r7HKdk2k01J6O4Hly7JdiLJVQ==
X-Received: by 2002:ac2:4a6a:0:b0:516:c9a8:5add with SMTP id q10-20020ac24a6a000000b00516c9a85addmr451677lfp.27.1712299472086;
        Thu, 04 Apr 2024 23:44:32 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qf15-20020a1709077f0f00b00a47439647efsm482203ejc.133.2024.04.04.23.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 23:44:31 -0700 (PDT)
Date: Fri, 5 Apr 2024 09:44:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ritvik Budhiraja <rbudhiraja@microsoft.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 3307/3504] fs/smb/client/file.c:619
 serverclose_work() error: uninitialized symbol 'rc'.
Message-ID: <422ce838-05f9-4e02-b852-5274faa997be@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
commit: a423dcbdabf457c0fff3669b0b20708d287c92c2 [3307/3504] smb3: retrying on failed server close
config: x86_64-randconfig-161-20240403 (https://download.01.org/0day-ci/archive/20240403/202404031415.cIBwV2aU-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404031415.cIBwV2aU-lkp@intel.com/

New smatch warnings:
fs/smb/client/file.c:619 serverclose_work() error: uninitialized symbol 'rc'.
fs/smb/client/file.c:732 _cifsFileInfo_put() error: uninitialized symbol 'rc'.

Old smatch warnings:
fs/smb/client/file.c:5050 cifs_oplock_break() warn: variable dereferenced before check 'inode' (see line 5021)

vim +/rc +619 fs/smb/client/file.c

a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  601  void serverclose_work(struct work_struct *work)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  602  {
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  603  	struct cifsFileInfo *cifs_file = container_of(work,
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  604  			struct cifsFileInfo, serverclose);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  605  
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  606  	struct cifs_tcon *tcon = tlink_tcon(cifs_file->tlink);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  607  
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  608  	struct TCP_Server_Info *server = tcon->ses->server;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  609  	int rc;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  610  	int retries = 0;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  611  	int MAX_RETRIES = 4;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  612  
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  613  	do {
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  614  		if (server->ops->close_getattr)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  615  			rc = server->ops->close_getattr(0, tcon, cifs_file);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  616  		else if (server->ops->close)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  617  			rc = server->ops->close(0, tcon, &cifs_file->fid);

rc not intialized on else path

a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  618  
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02 @619  		if (rc == -EBUSY || rc == -EAGAIN) {
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  620  			retries++;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  621  			msleep(250);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  622  		}
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  623  	} while ((rc == -EBUSY || rc == -EAGAIN) && (retries < MAX_RETRIES)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  624  	);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  625  
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  626  	if (retries == MAX_RETRIES)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  627  		pr_warn("Serverclose failed %d times, giving up\n", MAX_RETRIES);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  628  
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  629  	if (cifs_file->offload)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  630  		queue_work(fileinfo_put_wq, &cifs_file->put);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  631  	else
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  632  		cifsFileInfo_put_final(cifs_file);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  633  }
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  634  
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  635  /**
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  636   * cifsFileInfo_put - release a reference of file priv data
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  637   *
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  638   * Always potentially wait for oplock handler. See _cifsFileInfo_put().
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  639   *
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  640   * @cifs_file:	cifs/smb3 specific info (eg refcounts) for an open file
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  641   */
b33879aa834ebe fs/cifs/file.c       Jeff Layton      2010-10-15  642  void cifsFileInfo_put(struct cifsFileInfo *cifs_file)
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  643  {
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  644  	_cifsFileInfo_put(cifs_file, true, true);
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  645  }
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  646  
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  647  /**
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  648   * _cifsFileInfo_put - release a reference of file priv data
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  649   *
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  650   * This may involve closing the filehandle @cifs_file out on the
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  651   * server. Must be called without holding tcon->open_file_lock,
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  652   * cinode->open_file_lock and cifs_file->file_info_lock.
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  653   *
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  654   * If @wait_for_oplock_handler is true and we are releasing the last
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  655   * reference, wait for any running oplock break handler of the file
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  656   * and cancel any pending one.
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  657   *
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  658   * @cifs_file:	cifs/smb3 specific info (eg refcounts) for an open file
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  659   * @wait_oplock_handler: must be false if called from oplock_break_handler
607dfc79c37a0e fs/cifs/file.c       Steve French     2020-12-12  660   * @offload:	not offloaded on close and oplock breaks
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  661   *
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  662   */
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  663  void _cifsFileInfo_put(struct cifsFileInfo *cifs_file,
32546a9586aa45 fs/cifs/file.c       Ronnie Sahlberg  2019-11-03  664  		       bool wait_oplock_handler, bool offload)
b33879aa834ebe fs/cifs/file.c       Jeff Layton      2010-10-15  665  {
2b0143b5c986be fs/cifs/file.c       David Howells    2015-03-17  666  	struct inode *inode = d_inode(cifs_file->dentry);
96daf2b09178d8 fs/cifs/file.c       Steve French     2011-05-27  667  	struct cifs_tcon *tcon = tlink_tcon(cifs_file->tlink);
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  668  	struct TCP_Server_Info *server = tcon->ses->server;
e66673e39ac9d4 fs/cifs/file.c       Pavel Shilovsky  2010-11-02  669  	struct cifsInodeInfo *cifsi = CIFS_I(inode);
24261fc23db950 fs/cifs/file.c       Mateusz Guzik    2013-03-08  670  	struct super_block *sb = inode->i_sb;
24261fc23db950 fs/cifs/file.c       Mateusz Guzik    2013-03-08  671  	struct cifs_sb_info *cifs_sb = CIFS_SB(sb);
2bff0659338e58 fs/cifs/file.c       Steve French     2022-10-14  672  	struct cifs_fid fid = {};
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  673  	struct cifs_pending_open open;
ca7df8e0bb2a5e fs/cifs/file.c       Sachin Prabhu    2015-01-15  674  	bool oplock_break_cancelled;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  675  	bool serverclose_offloaded = false;
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  676  
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  677  	spin_lock(&tcon->open_file_lock);
1a67c415965752 fs/cifs/file.c       Pavel Shilovsky  2019-10-23  678  	spin_lock(&cifsi->open_file_lock);
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  679  	spin_lock(&cifs_file->file_info_lock);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  680  
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  681  	cifs_file->offload = offload;
5f6dbc9e4afe4d fs/cifs/file.c       Jeff Layton      2010-10-15  682  	if (--cifs_file->count > 0) {
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  683  		spin_unlock(&cifs_file->file_info_lock);
1a67c415965752 fs/cifs/file.c       Pavel Shilovsky  2019-10-23  684  		spin_unlock(&cifsi->open_file_lock);
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  685  		spin_unlock(&tcon->open_file_lock);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  686  		return;
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  687  	}
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  688  	spin_unlock(&cifs_file->file_info_lock);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  689  
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  690  	if (server->ops->get_lease_key)
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  691  		server->ops->get_lease_key(inode, &fid);
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  692  
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  693  	/* store open in pending opens to make sure we don't miss lease break */
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  694  	cifs_add_pending_open_locked(&fid, cifs_file->tlink, &open);
233839b1df65a2 fs/cifs/file.c       Pavel Shilovsky  2012-09-19  695  
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  696  	/* remove it from the lists */
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  697  	list_del(&cifs_file->flist);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  698  	list_del(&cifs_file->tlist);
fae8044c03c3c0 fs/cifs/file.c       Steve French     2018-10-19  699  	atomic_dec(&tcon->num_local_opens);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  700  
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  701  	if (list_empty(&cifsi->openFileList)) {
f96637be081141 fs/cifs/file.c       Joe Perches      2013-05-04  702  		cifs_dbg(FYI, "closing last open instance for inode %p\n",
2b0143b5c986be fs/cifs/file.c       David Howells    2015-03-17  703  			 d_inode(cifs_file->dentry));
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  704  		/*
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  705  		 * In strict cache mode we need invalidate mapping on the last
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  706  		 * close  because it may cause a error when we open this file
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  707  		 * again and get at least level II oplock.
253641388a4925 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  708  		 */
4f8ba8a0c09593 fs/cifs/file.c       Pavel Shilovsky  2010-11-21  709  		if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_STRICT_IO)
aff8d5ca7a3dca fs/cifs/file.c       Jeff Layton      2014-04-30  710  			set_bit(CIFS_INO_INVALID_MAPPING, &cifsi->flags);
c67236281c5d74 fs/cifs/file.c       Pavel Shilovsky  2010-11-03  711  		cifs_set_oplock_level(cifsi, 0);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  712  	}
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  713  
1a67c415965752 fs/cifs/file.c       Pavel Shilovsky  2019-10-23  714  	spin_unlock(&cifsi->open_file_lock);
3afca265b5f53a fs/cifs/file.c       Steve French     2016-09-22  715  	spin_unlock(&tcon->open_file_lock);
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  716  
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  717  	oplock_break_cancelled = wait_oplock_handler ?
b98749cac4a695 fs/cifs/file.c       Aurelien Aptel   2019-03-29  718  		cancel_work_sync(&cifs_file->oplock_break) : false;
ad635942c869ad fs/cifs/file.c       Jeff Layton      2011-07-26  719  
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  720  	if (!tcon->need_reconnect && !cifs_file->invalidHandle) {
0ff78a221bf783 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  721  		struct TCP_Server_Info *server = tcon->ses->server;
6d5786a34d98bf fs/cifs/file.c       Pavel Shilovsky  2012-06-20  722  		unsigned int xid;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  723  		int rc;
0ff78a221bf783 fs/cifs/file.c       Pavel Shilovsky  2012-09-18  724  
6d5786a34d98bf fs/cifs/file.c       Pavel Shilovsky  2012-06-20  725  		xid = get_xid();
43f8a6a74ee244 fs/cifs/file.c       Steve French     2019-12-02  726  		if (server->ops->close_getattr)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  727  			rc = server->ops->close_getattr(xid, tcon, cifs_file);
43f8a6a74ee244 fs/cifs/file.c       Steve French     2019-12-02  728  		else if (server->ops->close)
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  729  			rc = server->ops->close(xid, tcon, &cifs_file->fid);
760ad0cac19835 fs/cifs/file.c       Pavel Shilovsky  2012-09-25  730  		_free_xid(xid);

Same

a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  731  
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02 @732  		if (rc == -EBUSY || rc == -EAGAIN) {
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  733  			// Server close failed, hence offloading it as an async op
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  734  			queue_work(serverclose_wq, &cifs_file->serverclose);
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  735  			serverclose_offloaded = true;
a423dcbdabf457 fs/smb/client/file.c Ritvik Budhiraja 2024-04-02  736  		}
cdff08e76612e5 fs/cifs/file.c       Steve French     2010-10-21  737  	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

