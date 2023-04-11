Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3570C4436;
	Tue, 11 Apr 2023 08:47:52 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q29so6563871wrc.3;
        Tue, 11 Apr 2023 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681202870; x=1683794870;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcSbDmROyB9JrfeXBty7TXE8pwlqEqfRAMnHoL4xe8M=;
        b=Zl9er85rPVU+yCkgRypzOwRvPmIn7jrkCiBTvZueKK/zV5kmLC1ylADmwBrHJcvASr
         MgE5Sn+7oSTWLXRcddagbtPDZjk8EASQmvMu/cu9q1iENgRHvBPqVvOTCMLRVowb8wHY
         AptpfA87nvE5phNsC2J64G7yHEz5hDl9kjFKGjpoPvdHeVWuQGZnBRvUJhGkyy309R2C
         P+EdgU6atrNfBA9Ev6TGn74HJfIjtuBo2tCJiOL24So10JzoRj1pAJlqlB7LoiZxoGw4
         4oATyrZydRvs8zYFcNBCBJIPDRO7wkRFRzIGwtOrEHYJgPWgGxSKhTzaO1vApDcVoauV
         mxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681202870; x=1683794870;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcSbDmROyB9JrfeXBty7TXE8pwlqEqfRAMnHoL4xe8M=;
        b=iGkgKopFncz4LTGqPQibSEGXCZwG280w8ULYUTq+gaVTJJlmJU/36mGF7b8O3W4Zao
         vk6yH7QVIDSHHQe2xw/1Uma+a123v6WhcnvOiSoCY9AMMJ8INu8BFLdtkwVvxrMe9Liu
         ef+NZWUS1Fo/iRWUNb0dsVmw5s6SY7JPCf0g1KoiQeoUCKK9x4y5vVBUMQMYL6cb9RDb
         uNrNZ2My8R2UD3ZbZDeHAEt8UFhKO6rYHixpDzmqFuwvsyEfP9vQNs/4pn5ztU/sdEiA
         SkhJds/4Y6NQz12Ls+PPSrJlfFHjGhPagjl7AHDKVdG6PWk7lLExFbCkiuxuhzy8UDLM
         sH0g==
X-Gm-Message-State: AAQBX9eOGur1u67HC5V4SQxJDvAX1aOZ3KEsY7wPEb3fORPCZDEoU+Pp
	yh/Oxf2KDoOu2479lwFpJ//wMLpPAv8=
X-Google-Smtp-Source: AKy350ZyLTuox+eyC3iWY3l0syhevKVHk1i9NLYtOEe6PG0yIm4yU9TTCl3Z45G3zfUzJZPhkBQdig==
X-Received: by 2002:a5d:4d41:0:b0:2cf:ea62:58a0 with SMTP id a1-20020a5d4d41000000b002cfea6258a0mr1172989wru.16.1681202869846;
        Tue, 11 Apr 2023 01:47:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y9-20020a5d6209000000b002f29dc7eefdsm2316831wru.47.2023.04.11.01.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 01:47:49 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:47:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:pptrs-online-parent-repair 67/72]
 fs/xfs/scrub/dir_repair.c:825 xrep_dir_dump_tempdir() error: uninitialized
 symbol 'error'.
Message-ID: <6b29bcd4-dac1-4441-89e8-ca043c1e825c@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git pptrs-online-parent-repair
head:   fee9424c142b24fc3bc25e7ba5023aad692b9e2c
commit: 20a92e46fe80c2b704a9745406390ba785e84210 [67/72] xfs: compare generated and existing dirents
config: csky-randconfig-m031-20230409 (https://download.01.org/0day-ci/archive/20230409/202304091600.EeF4cLbd-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304091600.EeF4cLbd-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/dir_repair.c:825 xrep_dir_dump_tempdir() error: uninitialized symbol 'error'.

vim +/error +825 fs/xfs/scrub/dir_repair.c

dcb484bdb5855e Darrick J. Wong 2023-03-24  753  STATIC int
dcb484bdb5855e Darrick J. Wong 2023-03-24  754  xrep_dir_dump_tempdir(
dcb484bdb5855e Darrick J. Wong 2023-03-24  755  	struct xfs_scrub	*sc,
dcb484bdb5855e Darrick J. Wong 2023-03-24  756  	struct xfs_inode	*dp,
dcb484bdb5855e Darrick J. Wong 2023-03-24  757  	xfs_dir2_dataptr_t	dapos,
dcb484bdb5855e Darrick J. Wong 2023-03-24  758  	const struct xfs_name	*name,
dcb484bdb5855e Darrick J. Wong 2023-03-24  759  	xfs_ino_t		ino,
dcb484bdb5855e Darrick J. Wong 2023-03-24  760  	void			*priv)
dcb484bdb5855e Darrick J. Wong 2023-03-24  761  {
dcb484bdb5855e Darrick J. Wong 2023-03-24  762  	struct xrep_dir		*rd = priv;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  763  	xfs_ino_t		child_ino;
dcb484bdb5855e Darrick J. Wong 2023-03-24  764  	bool			child_dirent = true;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  765  	bool			compare_dirent = true;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  766  	int			error;
dcb484bdb5855e Darrick J. Wong 2023-03-24  767  
dcb484bdb5855e Darrick J. Wong 2023-03-24  768  	/*
dcb484bdb5855e Darrick J. Wong 2023-03-24  769  	 * The tempdir was created with a dotdot entry pointing to the root
dcb484bdb5855e Darrick J. Wong 2023-03-24  770  	 * directory.  Substitute whatever inode number we found during the
dcb484bdb5855e Darrick J. Wong 2023-03-24  771  	 * filesystem scan.
dcb484bdb5855e Darrick J. Wong 2023-03-24  772  	 *
dcb484bdb5855e Darrick J. Wong 2023-03-24  773  	 * The tempdir was also created with a dot entry pointing to itself.
dcb484bdb5855e Darrick J. Wong 2023-03-24  774  	 * Substitute the inode number of the directory being repaired.  A
dcb484bdb5855e Darrick J. Wong 2023-03-24  775  	 * prerequisite for the real repair code is a patchset to allow dir
dcb484bdb5855e Darrick J. Wong 2023-03-24  776  	 * callers to set the owner (and dot entry in the case of sf -> block
dcb484bdb5855e Darrick J. Wong 2023-03-24  777  	 * conversion) explicitly.
dcb484bdb5855e Darrick J. Wong 2023-03-24  778  	 *
dcb484bdb5855e Darrick J. Wong 2023-03-24  779  	 * I've chosen not to port the owner setting patchset or the swapext
dcb484bdb5855e Darrick J. Wong 2023-03-24  780  	 * patchset for this PoC, which is why we build the tempdir, compare
dcb484bdb5855e Darrick J. Wong 2023-03-24  781  	 * the contents, and drop the tempdir.
dcb484bdb5855e Darrick J. Wong 2023-03-24  782  	 */
dcb484bdb5855e Darrick J. Wong 2023-03-24  783  	if (xrep_dir_samename(name, &xfs_name_dotdot)) {
dcb484bdb5855e Darrick J. Wong 2023-03-24  784  		child_dirent = false;
dcb484bdb5855e Darrick J. Wong 2023-03-24  785  		ino = rd->parent_ino;
dcb484bdb5855e Darrick J. Wong 2023-03-24  786  	}
dcb484bdb5855e Darrick J. Wong 2023-03-24  787  	if (xrep_dir_samename(name, &xfs_name_dot)) {
dcb484bdb5855e Darrick J. Wong 2023-03-24  788  		child_dirent = false;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  789  		compare_dirent = false;

Both are false above.

dcb484bdb5855e Darrick J. Wong 2023-03-24  790  		ino = sc->ip->i_ino;
dcb484bdb5855e Darrick J. Wong 2023-03-24  791  	}
dcb484bdb5855e Darrick J. Wong 2023-03-24  792  
dcb484bdb5855e Darrick J. Wong 2023-03-24  793  	trace_xrep_dir_dumpname(sc->tempip, name, ino);
dcb484bdb5855e Darrick J. Wong 2023-03-24  794  
20a92e46fe80c2 Darrick J. Wong 2023-03-24  795  	/* Check that the dir being repaired has the same entry. */
20a92e46fe80c2 Darrick J. Wong 2023-03-24  796  	if (compare_dirent) {
20a92e46fe80c2 Darrick J. Wong 2023-03-24  797  		error = xchk_dir_lookup(sc, sc->ip, name, &child_ino);
20a92e46fe80c2 Darrick J. Wong 2023-03-24  798  		if (error == -ENOENT) {
20a92e46fe80c2 Darrick J. Wong 2023-03-24  799  			trace_xrep_dir_checkname(sc->ip, name, NULLFSINO);
20a92e46fe80c2 Darrick J. Wong 2023-03-24  800  			ASSERT(error != -ENOENT);
20a92e46fe80c2 Darrick J. Wong 2023-03-24  801  			return -EFSCORRUPTED;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  802  		}
20a92e46fe80c2 Darrick J. Wong 2023-03-24  803  		if (error)
20a92e46fe80c2 Darrick J. Wong 2023-03-24  804  			return error;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  805  
20a92e46fe80c2 Darrick J. Wong 2023-03-24  806  		if (ino != child_ino) {
20a92e46fe80c2 Darrick J. Wong 2023-03-24  807  			trace_xrep_dir_checkname(sc->ip, name, child_ino);
20a92e46fe80c2 Darrick J. Wong 2023-03-24  808  			ASSERT(ino == child_ino);
20a92e46fe80c2 Darrick J. Wong 2023-03-24  809  			return -EFSCORRUPTED;
20a92e46fe80c2 Darrick J. Wong 2023-03-24  810  		}
20a92e46fe80c2 Darrick J. Wong 2023-03-24  811  	}
20a92e46fe80c2 Darrick J. Wong 2023-03-24  812  
dcb484bdb5855e Darrick J. Wong 2023-03-24  813  	/*
dcb484bdb5855e Darrick J. Wong 2023-03-24  814  	 * Set ourselves up to free every dirent in the tempdir because
dcb484bdb5855e Darrick J. Wong 2023-03-24  815  	 * directory inactivation won't do it for us.  The rest of the online
dcb484bdb5855e Darrick J. Wong 2023-03-24  816  	 * fsck patchset provides us a means to swap the directory structure
dcb484bdb5855e Darrick J. Wong 2023-03-24  817  	 * and reap it responsibly, but I didn't feel like porting all that.
dcb484bdb5855e Darrick J. Wong 2023-03-24  818  	 */
dcb484bdb5855e Darrick J. Wong 2023-03-24  819  	if (child_dirent) {
dcb484bdb5855e Darrick J. Wong 2023-03-24  820  		mutex_lock(&rd->lock);
dcb484bdb5855e Darrick J. Wong 2023-03-24  821  		error = xrep_dir_remove_dirent(rd, name, ino);
dcb484bdb5855e Darrick J. Wong 2023-03-24  822  		mutex_unlock(&rd->lock);
dcb484bdb5855e Darrick J. Wong 2023-03-24  823  	}

Both false means uninitialized.

dcb484bdb5855e Darrick J. Wong 2023-03-24  824  
dcb484bdb5855e Darrick J. Wong 2023-03-24 @825  	return error;
dcb484bdb5855e Darrick J. Wong 2023-03-24  826  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

