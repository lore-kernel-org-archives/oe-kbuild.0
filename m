Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175AD63B3;
	Thu,  5 Jan 2023 11:46:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D1B3722B93;
	Thu,  5 Jan 2023 11:46:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C3470139C4;
	Thu,  5 Jan 2023 11:46:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OxaoL3y4tmOqOQAAMHmgww
	(envelope-from <jack@suse.cz>); Thu, 05 Jan 2023 11:46:04 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 53A30A0742; Thu,  5 Jan 2023 12:46:04 +0100 (CET)
Date: Thu, 5 Jan 2023 12:46:04 +0100
From: Jan Kara <jack@suse.cz>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Jan Kara <jack@suse.cz>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [jack-fs:for_next 31/33] fs/udf/file.c:177 udf_file_write_iter()
 warn: inconsistent returns '&iinfo->i_data_sem'.
Message-ID: <20230105114604.2fipna4zceoxmota@quack3>
References: <202301050355.Zcimjj6d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301050355.Zcimjj6d-lkp@intel.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.40
X-Spamd-Result: default: False [0.40 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

On Thu 05-01-23 07:25:23, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
> head:   e86812bfac97e23c9ad9e607c370c63b2e5b4722
> commit: 16919375dca0b1769b7ac956c0c492fbed476463 [31/33] udf: Do not update file length for failed writes to inline files
> config: parisc-randconfig-m041-20230102
> compiler: hppa-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> smatch warnings:
> fs/udf/file.c:177 udf_file_write_iter() warn: inconsistent returns '&iinfo->i_data_sem'.

I agree the locking of iinfo->i_data_sem in udf_file_write_iter() is not
obvious but AFAICS it is correct because udf_expand_file_adinicb() releases
iinfo->i_data_sem it has got. So this report is false positive.

								Honza

> 
> vim +177 fs/udf/file.c
> 
> d4637bc18f3bf8 Al Viro           2014-04-03  137  static ssize_t udf_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  138  {
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  139  	ssize_t retval;
> 543ade1fc901db Badari Pulavarty  2006-09-30  140  	struct file *file = iocb->ki_filp;
> 496ad9aa8ef448 Al Viro           2013-01-23  141  	struct inode *inode = file_inode(file);
> 48d6d8ff7dca80 Marcin Slusarz    2008-02-08  142  	struct udf_inode_info *iinfo = UDF_I(inode);
> 165f1a6e300d5a Al Viro           2015-04-07  143  	int err;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  144  
> 5955102c9984fa Al Viro           2016-01-22  145  	inode_lock(inode);
> 165f1a6e300d5a Al Viro           2015-04-07  146  
> 3309dd04cbcd2c Al Viro           2015-04-09  147  	retval = generic_write_checks(iocb, from);
> 3309dd04cbcd2c Al Viro           2015-04-09  148  	if (retval <= 0)
> 165f1a6e300d5a Al Viro           2015-04-07  149  		goto out;
> 165f1a6e300d5a Al Viro           2015-04-07  150  
> 8754a3f718f08d Jan Kara          2010-11-16  151  	down_write(&iinfo->i_data_sem);
> 16919375dca0b1 Jan Kara          2023-01-02  152  	if (iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB &&
> 16919375dca0b1 Jan Kara          2023-01-02  153  	    inode->i_sb->s_blocksize < (udf_file_entry_alloc_offset(inode) +
> 16919375dca0b1 Jan Kara          2023-01-02  154  				 iocb->ki_pos + iov_iter_count(from))) {
> 7e49b6f2480cb9 Jan Kara          2010-10-22  155  		err = udf_expand_file_adinicb(inode);
> 7e49b6f2480cb9 Jan Kara          2010-10-22  156  		if (err) {
> 5955102c9984fa Al Viro           2016-01-22  157  			inode_unlock(inode);
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  158  			udf_debug("udf_expand_adinicb: err=%d\n", err);
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  159  			return err;
> 
> up_write(&iinfo->i_data_sem);?
> 
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  160  		}
> d2eb8c359309ec Jan Kara          2011-12-10  161  	} else
> 8754a3f718f08d Jan Kara          2010-11-16  162  		up_write(&iinfo->i_data_sem);
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  163  
> d4637bc18f3bf8 Al Viro           2014-04-03  164  	retval = __generic_file_write_iter(iocb, from);
> 5f380c7fa7e01f Al Viro           2015-04-07  165  out:
> 16919375dca0b1 Jan Kara          2023-01-02  166  	down_write(&iinfo->i_data_sem);
> 16919375dca0b1 Jan Kara          2023-01-02  167  	if (iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB && retval > 0)
> 16919375dca0b1 Jan Kara          2023-01-02  168  		iinfo->i_lenAlloc = inode->i_size;
> 16919375dca0b1 Jan Kara          2023-01-02  169  	up_write(&iinfo->i_data_sem);
> 5955102c9984fa Al Viro           2016-01-22  170  	inode_unlock(inode);
> 09ebb17ab476b6 Jan Kara          2014-02-18  171  
> 09ebb17ab476b6 Jan Kara          2014-02-18  172  	if (retval > 0) {
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  173  		mark_inode_dirty(inode);
> e259221763a404 Christoph Hellwig 2016-04-07  174  		retval = generic_write_sync(iocb, retval);
> 09ebb17ab476b6 Jan Kara          2014-02-18  175  	}
> 28de7948a89676 Cyrill Gorcunov   2007-07-21  176  
> ^1da177e4c3f41 Linus Torvalds    2005-04-16 @177  	return retval;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  178  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
