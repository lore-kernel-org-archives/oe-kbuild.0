Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920A1210D
	for <oe-kbuild@lists.linux.dev>; Fri, 26 May 2023 04:23:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f68fc6b479so3351125e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 25 May 2023 21:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685075020; x=1687667020;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qX/WNsmBHfp5G9EyVT9VdMRN610FVSgJc9LiVnqbc5Y=;
        b=jcOUrfpVAS8O6BBw9ok3JX7xBHdIEWq8o7x1jdZ9A6mKIUDkfHUlqe0wgyRmjC91Dc
         AlNvKDG0gAUghC1JpmUVWfti8hRAojiOrFfrdq9yOHjwcUdnVcxqBJJbO0U5xkp+1EYy
         F8tyIQsorM2BDcC74mB8BwMvLDp8n7mWiqTLBlp122AN2i1kkQJesTZnrzriLayxFFBK
         JeZbZ5snHKJAHJSwY1V6Q//TI+AZ0v6KEfEDisOnlJwdAP8K6rhxqaBrJc7mMfzSELXR
         YvqzMJSk9rRl/3Uzn7g5S5I3Wp++H8/CPMCK8kpaAQYwdq4PF+HjaL66z4HfeluBBIdN
         Em8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685075020; x=1687667020;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qX/WNsmBHfp5G9EyVT9VdMRN610FVSgJc9LiVnqbc5Y=;
        b=iOgDNJ+VMJ23kFuV0xqh2okk1KipjePwf95U2mZm6o3lp5hM1aztBx2LcR00Xtl76W
         82w8ngxKYqHFrhc2aW/VWrEfLrUD3eynYxf+cPLeFKkqgaFfmvevTmuFywurHi1Aj+03
         V18/gq9vCPwsqDOj2YRZZk2U3ej5cy5TqBBw/Q5jy624jrvioZDkMJMpNTIFe+yzgpKY
         70E+7O6M5/gMQdHYo1yyAflXmz1k/hpsKpwo8PvFsUQUrPCX2Dm1L+ukov4JfdAqYpjC
         ignThCrODNAo4DUpOfBJs3dGFxr98XmSHO3Dbz+ykk258Wpke7gk5/jN9dxNOUmG5sRc
         jVPA==
X-Gm-Message-State: AC+VfDz5CpDYDnHG4VRzUZWVoZsdsW2WBlIuj7NNz7tOel51BWA4PLqR
	gjE+uT9MWfiybFokL25XKHMPeIyYQbjIaPL/j60=
X-Google-Smtp-Source: ACHHUZ6ggTsjCV31x9AxvuvSARUFX92eGbflnxv9HIcm9UerihcRlDcQ8C9LmqXh/p/D/zTLDEKp7A==
X-Received: by 2002:adf:efc9:0:b0:30a:bcbf:5d2b with SMTP id i9-20020adfefc9000000b0030abcbf5d2bmr317013wrp.28.1685075019863;
        Thu, 25 May 2023 21:23:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y4-20020adfd084000000b0030abe7c36b1sm3628012wrh.93.2023.05.25.21.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 21:23:38 -0700 (PDT)
Date: Fri, 26 May 2023 07:23:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Steve French <stfrench@microsoft.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4604/4815] fs/smb/server/transport_ipc.c:232
 ipc_msg_alloc() warn: Please consider using kvzalloc instead of kvmalloc
Message-ID: <3670abde-ac61-458f-b7e0-2f8eaa24187d@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a3d37b4d885129561e1cef361216f00472f7d2e
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d [4604/4815] smb: move client and server files to common directory fs/smb
config: parisc-randconfig-m041-20230524
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305260413.raWgPs2H-lkp@intel.com/

New smatch warnings:
fs/smb/server/transport_ipc.c:232 ipc_msg_alloc() warn: Please consider using kvzalloc instead of kvmalloc
fs/smb/server/transport_ipc.c:271 handle_response() warn: Please consider using kvzalloc instead of kvmalloc
fs/smb/server/smb_common.c:350 smb1_allocate_rsp_buf() warn: Please consider using kzalloc instead of kmalloc
fs/smb/server/vfs.c:427 ksmbd_vfs_stream_write() warn: Please consider using kvzalloc instead of kvmalloc
fs/smb/server/vfs.c:828 ksmbd_vfs_listxattr() warn: Please consider using kvzalloc instead of kvmalloc
fs/smb/server/smb2pdu.c:533 smb2_allocate_rsp_buf() warn: Please consider using kvzalloc instead of kvmalloc
fs/smb/server/smb2pdu.c:6074 smb2_read_pipe() warn: Please consider using kvzalloc instead of kvmalloc
fs/smb/server/smb2pdu.c:6226 smb2_read() warn: Please consider using kvzalloc instead of kvmalloc
fs/smb/server/smb2pdu.c:6375 smb2_write_rdma_channel() warn: Please consider using kvzalloc instead of kvmalloc

vim +232 fs/smb/server/transport_ipc.c

0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  227  static struct ksmbd_ipc_msg *ipc_msg_alloc(size_t sz)
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  228  {
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  229  	struct ksmbd_ipc_msg *msg;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  230  	size_t msg_sz = sz + sizeof(struct ksmbd_ipc_msg);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  231  
79f6b11a104f3a fs/cifsd/transport_ipc.c Namjae Jeon  2021-04-02 @232  	msg = kvmalloc(msg_sz, GFP_KERNEL | __GFP_ZERO);

It wasn't me who wrote this check about using kvzalloc() instead of
passing __GFP_ZERO.  That feels like a style debate...  :/

0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  233  	if (msg)
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  234  		msg->sz = sz;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  235  	return msg;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  236  }
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  237  
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  238  static void ipc_msg_free(struct ksmbd_ipc_msg *msg)
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  239  {
79f6b11a104f3a fs/cifsd/transport_ipc.c Namjae Jeon  2021-04-02  240  	kvfree(msg);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  241  }
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  242  
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  243  static void ipc_msg_handle_free(int handle)
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  244  {
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  245  	if (handle >= 0)
d40012a83f87f4 fs/cifsd/transport_ipc.c Namjae Jeon  2021-04-13  246  		ksmbd_release_id(&ipc_ida, handle);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  247  }
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  248  
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  249  static int handle_response(int type, void *payload, size_t sz)
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  250  {
b622948789a96a fs/ksmbd/transport_ipc.c Hyunchul Lee 2021-06-25  251  	unsigned int handle = *(unsigned int *)payload;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  252  	struct ipc_msg_table_entry *entry;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  253  	int ret = 0;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  254  
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  255  	ipc_update_last_active();
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  256  	down_read(&ipc_msg_table_lock);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  257  	hash_for_each_possible(ipc_msg_table, entry, ipc_table_hlist, handle) {
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  258  		if (handle != entry->handle)
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  259  			continue;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  260  
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  261  		entry->response = NULL;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  262  		/*
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  263  		 * Response message type value should be equal to
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  264  		 * request message type + 1.
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  265  		 */
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  266  		if (entry->type + 1 != type) {
bde1694aecdb53 fs/cifsd/transport_ipc.c Namjae Jeon  2021-06-28  267  			pr_err("Waiting for IPC type %d, got %d. Ignore.\n",
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  268  			       entry->type + 1, type);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  269  		}
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  270  
79f6b11a104f3a fs/cifsd/transport_ipc.c Namjae Jeon  2021-04-02 @271  		entry->response = kvmalloc(sz, GFP_KERNEL | __GFP_ZERO);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  272  		if (!entry->response) {
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  273  			ret = -ENOMEM;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  274  			break;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  275  		}
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  276  
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  277  		memcpy(entry->response, payload, sz);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  278  		wake_up_interruptible(&entry->wait);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  279  		ret = 0;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  280  		break;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  281  	}
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  282  	up_read(&ipc_msg_table_lock);
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  283  
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  284  	return ret;
0626e6641f6b46 fs/cifsd/transport_ipc.c Namjae Jeon  2021-03-16  285  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

