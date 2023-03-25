Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9D920E1
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Mar 2023 08:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679734737; x=1711270737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MnbaiUTm+L+uRHdZFEWNwRmej3A5iTGz+WzCLv2fP8A=;
  b=jzdwvM7WXnqMDYdZ1H0uLrf+qlKDyryw+lc5470zdXM7CP8BZfE9Q7Mt
   KVc3oL3YuTqS9zVJwvG/ZD6ywGAQ7qJfy2zm+z6NZS2ZhLLi9Yv++h796
   pfvfJkWzqXOYGrHyawwoPqZ2UsYulc4cl/R5zuBQE8AgGig/CJWzilDr3
   M5JRu8Ph+8RQwZ0+2/WOAar0a7hs64sG3N5GQjXD9aqRxGal+7WTU8Q4D
   bWLi7fvmASoKW6Zk/KfCl2bXcRn6sgAb2FFevm+jlPheHcHS/glB9VR5l
   eag24KQ63YHb+iI4jE6zJ6QGILEcfyj/Ks6m+9beZfiP3jArbwNsHUNMZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="402551869"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="402551869"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 01:58:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="713319231"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="713319231"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Mar 2023 01:58:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfzjj-000G8N-1I;
	Sat, 25 Mar 2023 08:58:55 +0000
Date: Sat, 25 Mar 2023 16:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/trace/trace_events_hist.c:5363:30: warning: Dereference of
 null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202303251659.IdQnvYVz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/trace/trace_events_hist.c:5363:30: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>
CC: Tom Zanussi <zanussi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   65aca32efdcb0965502d3db2f1fa33838c070952
commit: a2c54256dec7510477e2b4f4db187e638f7cac37 tracing: Add .graph suffix option to histogram value
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20230322 (https://download.01.org/0day-ci/archive/20230325/202303251659.IdQnvYVz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a2c54256dec7510477e2b4f4db187e638f7cac37
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a2c54256dec7510477e2b4f4db187e638f7cac37
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303251659.IdQnvYVz-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2186:6: note: 'ref_field' is non-null
           if (ref_field) {
               ^~~~~~~~~
   kernel/trace/trace_events_hist.c:2186:2: note: Taking true branch
           if (ref_field) {
           ^
   kernel/trace/trace_events_hist.c:2187:7: note: Calling 'init_var_ref'
                   if (init_var_ref(ref_field, var_field, system, event_name)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2090:6: note: 'system' is non-null
           if (system) {
               ^~~~~~
   kernel/trace/trace_events_hist.c:2090:2: note: Taking true branch
           if (system) {
           ^
   kernel/trace/trace_events_hist.c:2092:7: note: Assuming field 'system' is null
                   if (!ref_field->system)
                       ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2092:3: note: Taking true branch
                   if (!ref_field->system)
                   ^
   kernel/trace/trace_events_hist.c:2093:4: note: Returning without deallocating memory or storing the pointer for later deallocation
                           return -ENOMEM;
                           ^
   kernel/trace/trace_events_hist.c:2187:7: note: Returning from 'init_var_ref'
                   if (init_var_ref(ref_field, var_field, system, event_name)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2187:3: note: Taking true branch
                   if (init_var_ref(ref_field, var_field, system, event_name)) {
                   ^
   kernel/trace/trace_events_hist.c:2189:4: note: Potential leak of memory pointed to by 'ref_field'
                           return NULL;
                           ^
   kernel/trace/trace_events_hist.c:2911:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(synthetic_name, "synthetic_");
           ^~~~~~
   kernel/trace/trace_events_hist.c:2911:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(synthetic_name, "synthetic_");
           ^~~~~~
   kernel/trace/trace_events_hist.c:2912:2: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(synthetic_name, field_name);
           ^~~~~~
   kernel/trace/trace_events_hist.c:2912:2: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
           strcat(synthetic_name, field_name);
           ^~~~~~
   kernel/trace/trace_events_hist.c:3003:2: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(cmd, "keys=");
           ^~~~~~
   kernel/trace/trace_events_hist.c:3003:2: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
           strcat(cmd, "keys=");
           ^~~~~~
   kernel/trace/trace_events_hist.c:3008:4: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(cmd, ",");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:3008:4: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                           strcat(cmd, ",");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:3009:3: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(cmd, key_field->field->name);
                   ^~~~~~
   kernel/trace/trace_events_hist.c:3009:3: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                   strcat(cmd, key_field->field->name);
                   ^~~~~~
   kernel/trace/trace_events_hist.c:3014:2: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(cmd, ":synthetic_");
           ^~~~~~
   kernel/trace/trace_events_hist.c:3014:2: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
           strcat(cmd, ":synthetic_");
           ^~~~~~
   kernel/trace/trace_events_hist.c:3015:2: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(cmd, field_name);
           ^~~~~~
   kernel/trace/trace_events_hist.c:3015:2: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
           strcat(cmd, field_name);
           ^~~~~~
   kernel/trace/trace_events_hist.c:3016:2: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(cmd, "=");
           ^~~~~~
   kernel/trace/trace_events_hist.c:3016:2: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
           strcat(cmd, "=");
           ^~~~~~
   kernel/trace/trace_events_hist.c:3017:2: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(cmd, field_name);
           ^~~~~~
   kernel/trace/trace_events_hist.c:3017:2: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
           strcat(cmd, field_name);
           ^~~~~~
   kernel/trace/trace_events_hist.c:3022:3: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(cmd, " if ");
                   ^~~~~~
   kernel/trace/trace_events_hist.c:3022:3: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                   strcat(cmd, " if ");
                   ^~~~~~
   kernel/trace/trace_events_hist.c:3023:3: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(cmd, saved_filter);
                   ^~~~~~
   kernel/trace/trace_events_hist.c:3023:3: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                   strcat(cmd, saved_filter);
                   ^~~~~~
>> kernel/trace/trace_events_hist.c:5363:30: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   pc = __get_percentage(val, stats[idx].total);
                                              ^
   kernel/trace/trace_events_hist.c:5492:15: note: Assuming 'event_file' is non-null
           if (unlikely(!event_file)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/trace/trace_events_hist.c:5492:2: note: Taking false branch
           if (unlikely(!event_file)) {
           ^
   kernel/trace/trace_events_hist.c:5497:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(data, &event_file->triggers, list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   kernel/trace/trace_events_hist.c:5498:7: note: Assuming field 'trigger_type' is equal to ETT_EVENT_HIST
                   if (data->cmd_ops->trigger_type == ETT_EVENT_HIST)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5498:3: note: Taking true branch
                   if (data->cmd_ops->trigger_type == ETT_EVENT_HIST)
                   ^
   kernel/trace/trace_events_hist.c:5499:4: note: Calling 'hist_trigger_show'
                           hist_trigger_show(m, data, n++);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5464:6: note: 'n' is <= 0
           if (n > 0)
               ^
   kernel/trace/trace_events_hist.c:5464:2: note: Taking false branch
           if (n > 0)
           ^
   kernel/trace/trace_events_hist.c:5472:14: note: Calling 'print_entries'
           n_entries = print_entries(m, hist_data);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5416:2: note: 'stats' initialized to a null pointer value
           struct hist_val_stat *stats = NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5422:6: note: Assuming 'n_entries' is >= 0
           if (n_entries < 0)
               ^~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5422:2: note: Taking false branch
           if (n_entries < 0)
           ^
   kernel/trace/trace_events_hist.c:5426:14: note: Assuming 'j' is >= field 'n_vals'
           for (j = 0; j < hist_data->n_vals; j++) {
                       ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5426:2: note: Loop condition is false. Execution continues on line 5446
           for (j = 0; j < hist_data->n_vals; j++) {
           ^
   kernel/trace/trace_events_hist.c:5446:14: note: Assuming 'i' is < 'n_entries'
           for (i = 0; i < n_entries; i++)
                       ^~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5446:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < n_entries; i++)
           ^
   kernel/trace/trace_events_hist.c:5446:14: note: Assuming 'i' is < 'n_entries'
           for (i = 0; i < n_entries; i++)
                       ^~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5446:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < n_entries; i++)
           ^
   kernel/trace/trace_events_hist.c:5447:42: note: Passing null pointer value via 3rd parameter 'stats'
                   hist_trigger_entry_print(m, hist_data, stats,
                                                          ^~~~~
   kernel/trace/trace_events_hist.c:5447:3: note: Calling 'hist_trigger_entry_print'
                   hist_trigger_entry_print(m, hist_data, stats,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5394:14: note: Assuming 'i' is < field 'n_vals'
           for (i = 1; i < hist_data->n_vals; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5394:2: note: Loop condition is true.  Entering loop body
           for (i = 1; i < hist_data->n_vals; i++) {
           ^
   kernel/trace/trace_events_hist.c:5398:7: note: Assuming the condition is false
                   if (flags & HIST_FIELD_FL_VAR || flags & HIST_FIELD_FL_EXPR)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5398:7: note: Left side of '||' is false
   kernel/trace/trace_events_hist.c:5398:36: note: Assuming the condition is false
                   if (flags & HIST_FIELD_FL_VAR || flags & HIST_FIELD_FL_EXPR)
                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5398:3: note: Taking false branch
                   if (flags & HIST_FIELD_FL_VAR || flags & HIST_FIELD_FL_EXPR)
                   ^
   kernel/trace/trace_events_hist.c:5402:51: note: Passing null pointer value via 5th parameter 'stats'
                   hist_trigger_print_val(m, i, field_name, flags, stats, elt);
                                                                   ^~~~~
   kernel/trace/trace_events_hist.c:5402:3: note: Calling 'hist_trigger_print_val'
                   hist_trigger_print_val(m, i, field_name, flags, stats, elt);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5362:6: note: Assuming the condition is true
           if (flags & HIST_FIELD_FL_PERCENT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5362:2: note: Taking true branch
           if (flags & HIST_FIELD_FL_PERCENT) {
           ^
   kernel/trace/trace_events_hist.c:5363:30: note: Dereference of null pointer
                   pc = __get_percentage(val, stats[idx].total);
                                              ^~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5371:36: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]

vim +5363 kernel/trace/trace_events_hist.c

a2c54256dec751 Masami Hiramatsu (Google  2022-10-20  5352) 
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5353) static void hist_trigger_print_val(struct seq_file *m, unsigned int idx,
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5354) 				   const char *field_name, unsigned long flags,
a2c54256dec751 Masami Hiramatsu (Google  2022-10-20  5355) 				   struct hist_val_stat *stats,
a2c54256dec751 Masami Hiramatsu (Google  2022-10-20  5356) 				   struct tracing_map_elt *elt)
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5357) {
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5358) 	u64 val = tracing_map_read_sum(elt, idx);
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5359) 	unsigned int pc;
a2c54256dec751 Masami Hiramatsu (Google  2022-10-20  5360) 	char bar[21];
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5361) 
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5362) 	if (flags & HIST_FIELD_FL_PERCENT) {
a2c54256dec751 Masami Hiramatsu (Google  2022-10-20 @5363) 		pc = __get_percentage(val, stats[idx].total);
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5364) 		if (pc == UINT_MAX)
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5365) 			seq_printf(m, " %s (%%):[ERROR]", field_name);
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5366) 		else
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5367) 			seq_printf(m, " %s (%%): %3u.%02u", field_name,
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5368) 					pc / 100, pc % 100);
a2c54256dec751 Masami Hiramatsu (Google  2022-10-20  5369) 	} else if (flags & HIST_FIELD_FL_GRAPH) {
a2c54256dec751 Masami Hiramatsu (Google  2022-10-20  5370) 		seq_printf(m, " %s: %20s", field_name,
a2c54256dec751 Masami Hiramatsu (Google  2022-10-20  5371) 			   __fill_bar_str(bar, 20, val, stats[idx].max));
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5372) 	} else if (flags & HIST_FIELD_FL_HEX) {
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5373) 		seq_printf(m, " %s: %10llx", field_name, val);
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5374) 	} else {
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5375) 		seq_printf(m, " %s: %10llu", field_name, val);
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5376) 	}
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5377) }
abaa5258ce5e58 Masami Hiramatsu (Google  2022-10-20  5378) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
