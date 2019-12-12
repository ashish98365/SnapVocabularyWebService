package com.snapvocabulary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.google.common.collect.ObjectArrays;
import com.snapvocabulary.dictionary.VocabWord1TO7;
import com.snapvocabulary.dictionary.VocabWord8To14;

@Controller
public class AndroidDictionary
{
	@GetMapping("/get-all-word-count")
	@ResponseBody
	public int getOverallWordCount()
	{
		String[] both = ObjectArrays.concat(VocabWord1TO7.wordGroup, VocabWord8To14.wordGroup,String.class);
		return both.length;
	}
	
	@GetMapping("/get-all-words")
	@ResponseBody
	public String getAllWord() throws JsonProcessingException
	{
		ObjectWriter objectWriter = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String[] both = ObjectArrays.concat(VocabWord1TO7.wordGroup, VocabWord8To14.wordGroup,String.class); 
		return objectWriter.writeValueAsString(both);
	}
}
